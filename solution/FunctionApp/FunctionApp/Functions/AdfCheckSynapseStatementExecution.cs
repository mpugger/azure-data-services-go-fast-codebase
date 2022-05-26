using System;
using System.IO;
using System.Threading.Tasks;
using FunctionApp.DataAccess;
using FunctionApp.Models;
using FunctionApp.Models.Options;
using FunctionApp.Services;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Azure.WebJobs;
using Microsoft.Azure.WebJobs.Extensions.Http;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Options;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;

namespace FunctionApp.Functions
{
    /// <summary>
    /// Stores logs generated by the data factory (or other callers) into the default logging implemented by the
    ///  Azure Function (App Insights)
    /// </summary>
    public class AdfCheckSynapseStatementExecution
    {
        private readonly IOptions<ApplicationOptions> _options;
        private readonly TaskMetaDataDatabase _taskMetaDataDatabase;
        private readonly AzureSynapseService _azureSynapseService;
        public string SessionFolder { get; set; }


        public AdfCheckSynapseStatementExecution(IOptions<ApplicationOptions> options, TaskMetaDataDatabase taskMetaDataDatabase, AzureSynapseService azureSynapseService)
        {
            _options = options;
            _taskMetaDataDatabase = taskMetaDataDatabase;
            _azureSynapseService = azureSynapseService;
        }

        [FunctionName("CheckSynapseStatementExecution")]
        public async Task<IActionResult> Run(
            [HttpTrigger(AuthorizationLevel.Function, "post", Route = null)] HttpRequest req,
            ILogger log, ExecutionContext context)
        {
            Guid executionId = context.InvocationId;
            FrameworkRunner frp = new FrameworkRunner(log, executionId);
            this.SessionFolder = context.FunctionAppDirectory;
            FrameworkRunnerWorkerWithHttpRequest worker = AdfCheckSynapseStatementExecutionCore;
            FrameworkRunnerResult result = await frp.Invoke(req, "AdfCheckSynapseStatementExecution", worker);
            if (result.Succeeded)
            {
                return new OkObjectResult(JObject.Parse(result.ReturnObject));
            }
            else
            {
                return new BadRequestObjectResult(new { Error = "Execution Failed...." });
            }

        }
        public async Task<JObject> AdfCheckSynapseStatementExecutionCore(HttpRequest req,
            Logging.Logging LogHelper)
        {
            string requestBody = await new StreamReader(req.Body).ReadToEndAsync();
            JObject data = JObject.Parse(requestBody);
            var res = await _azureSynapseService.CheckStatementExecution(data, LogHelper);            

            return new JObject
            {
                ["Result"] = res
            };
        }
    }
}
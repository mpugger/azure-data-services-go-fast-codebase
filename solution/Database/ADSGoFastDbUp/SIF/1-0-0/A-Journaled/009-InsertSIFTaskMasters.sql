
INSERT [dbo].[TaskMaster] ([TaskMasterId], [TaskMasterName], [TaskTypeId], [TaskGroupId], [ScheduleMasterId], [SourceSystemId], [TargetSystemId], [DegreeOfCopyParallelism], [AllowMultipleActiveInstances], [TaskDatafactoryIR], [TaskMasterJSON], [ActiveYN], [DependencyChainTag], [EngineId]) 
VALUES (N'SIF - StudentPersonal', -5, -1, -4, -4, -5, 1, 0, N'Azure', N'{"CustomDefinitions":"","ExecuteNotebook":"SIFParameterizedJson","Purview":"Disabled","QualifiedIDAssociation":"TaskMasterId","Source":{"DataFileName":"StudentPersonal.json","RelativePath":"/samples/sif/","SchemaFileName":"","Type":"Notebook-Optional","WriteSchemaToPurview":"Disabled"},"Target":{"DataFileName":"StudentPersonal.parquet","RelativePath":"/synapse/sif/StudentPersonal/","SchemaFileName":"","Type":"Notebook-Optional","WriteSchemaToPurview":"Disabled"},"UseNotebookActivity":"Enabled"}', 1, NULL, -2)
GO
INSERT [dbo].[TaskMaster] ([TaskMasterId], [TaskMasterName], [TaskTypeId], [TaskGroupId], [ScheduleMasterId], [SourceSystemId], [TargetSystemId], [DegreeOfCopyParallelism], [AllowMultipleActiveInstances], [TaskDatafactoryIR], [TaskMasterJSON], [ActiveYN], [DependencyChainTag], [EngineId]) 
VALUES (N'SIF - Calendar Date', -5, -1, -4, -4, -5, 1, 0, N'Azure', N'{"CustomDefinitions":"","ExecuteNotebook":"SIFParameterizedJson","Purview":"Disabled","QualifiedIDAssociation":"TaskMasterId","Source":{"DataFileName":"CalendarDate.json","RelativePath":"/samples/sif/","SchemaFileName":"","Type":"Notebook-Optional","WriteSchemaToPurview":"Disabled"},"Target":{"DataFileName":"CalendarDate.parquet","RelativePath":"/synapse/sif/CalendarDate/","SchemaFileName":"","Type":"Notebook-Optional","WriteSchemaToPurview":"Disabled"},"UseNotebookActivity":"Enabled"}', 1, NULL, -2)
GO
INSERT [dbo].[TaskMaster] ([TaskMasterName], [TaskTypeId], [TaskGroupId], [ScheduleMasterId], [SourceSystemId], [TargetSystemId], [DegreeOfCopyParallelism], [AllowMultipleActiveInstances], [TaskDatafactoryIR], [TaskMasterJSON], [ActiveYN], [DependencyChainTag], [EngineId]) 
VALUES (N'SIF - StudentSchoolEnrollment', -5, -1, -4, -4, -5, 1, 0, N'Azure', N'{"CustomDefinitions":"","ExecuteNotebook":"SIFParameterizedJson","Purview":"Disabled","QualifiedIDAssociation":"TaskMasterId","Source":{"DataFileName":"StudentSchoolEnrollment.json","RelativePath":"/samples/sif/","SchemaFileName":"","Type":"Notebook-Optional","WriteSchemaToPurview":"Disabled"},"Target":{"DataFileName":"StudentSchoolEnrollment.parquet","RelativePath":"/synapse/sif/StudentSchoolEnrollmenT/","SchemaFileName":"","Type":"Notebook-Optional","WriteSchemaToPurview":"Disabled"},"UseNotebookActivity":"Enabled"}', 1, NULL, -2)
GO

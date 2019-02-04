var parentContextFolder = SharedKmcsSession.KmcsSession.MainService.GetContextFolder(contextId);
contextFolder.Name = string.IsNullOrEmpty(readerNew["Description"].ToString()) ? readerNew["ItemID"].ToString() : readerNew["Description"]?.ToString().Length > 60 ? readerNew["Description"].ToString().Substring(0, 60) : readerNew["Description"].ToString();
contextFolder.SysInternal = false;
contextFolder.ContainerType = "CONTEXT_FOLDER";
contextFolder.Pid = parentContextFolder.Id;
contextFolder.ContextContainerId = contextId;
contextFolder = SharedKmcsSession.KmcsSession.MainService.CreateContextFolder(contextFolder, null, "DMS");
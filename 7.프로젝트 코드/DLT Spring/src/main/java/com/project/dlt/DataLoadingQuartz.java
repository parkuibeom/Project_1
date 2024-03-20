package com.project.dlt;


import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

public class DataLoadingQuartz implements Job{

	@Override
	public void execute(JobExecutionContext ctx) throws JobExecutionException {
		try {
			new DiseaseApiData();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

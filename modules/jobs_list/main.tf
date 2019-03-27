resource "google_storage_bucket" "tmp_dir_bucket" {
  name          = "${var.temp_gcs_location}"
  location      = "${var.bucket_region}"
  storage_class = "REGIONAL"
  project       = "${var.project_id}"
}

resource "google_dataflow_job" "dataflow_jobs" {
  count             = "${var.is_jobs_list ? length(var.jobs_list) : 1}"
  project_id           = "${var.project_id}"
  temp_gcs_location = "gs://${google_storage_bucket.tmp_dir_bucket.name}/tmp_dir"
  job_name              = "${lookup(var.jobs_list[count.index], "job_name")}"
  on_delete              = "${lookup(var.jobs_list[count.index], "on_delete")}"
  max_workers              = "${lookup(var.jobs_list[count.index], "max_workers")}"
  template_gcs_path              = "${lookup(var.jobs_list[count.index], "template_gcs_path")}"
  parameters              = "${lookup(var.jobs_list[count.index], "parameters")}"
  /*
    Retrieving the parameters map as above returns the following error:

    Error: module.dataflow-jobs.google_dataflow_job.dataflow_jobs: 1 error(s) occurred:

    * module.dataflow-jobs.google_dataflow_job.dataflow_jobs: lookup: lookup() may only be used with flat maps, this map contains elements of type map in:

    ${lookup(var.jobs_list[count.index], "parameters")}
  */

  #parameters = "${lookup(element(var.jobs_list, count.index), "parameters")}"
  /*
    Retrieving the parameters map as above returns the following error.

    Error: module.dataflow-jobs.google_dataflow_job.dataflow_jobs: 1 error(s) occurred:

    * module.dataflow-jobs.google_dataflow_job.dataflow_jobs: At column 3, line 1: lookup: argument 1 should be type map, got type string in:

    ${lookup(element(var.jobs_list, count.index), "parameters")}
  */
}

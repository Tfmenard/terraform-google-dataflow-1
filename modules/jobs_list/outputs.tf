/**
 * Copyright 2018 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

output "df_job_name" {
  description = "The name of the dataflow job"
  value       = "${element(concat(google_dataflow_job.dataflow_jobs.*.name, list("")),0)}"
}

/*
output "df_job_template_gcs_path" {
  description = "The GCS path to the Dataflow job template."
  value = "${google_dataflow_job.dataflow_job.template_gcs_path}"
}

output "temp_gcs_location" {
  description = "The GCS path for the Dataflow job's temporary data."
  value = "${google_dataflow_job.dataflow_job.temp_gcs_location}"
}

output "df_job_state" {
  description = "The state of the newly created Dataflow job"
  value = "${google_dataflow_job.dataflow_job.state}"
}

output "df_job_id" {
  description = "The unique Id of the newly created Dataflow job"
  value = "${google_dataflow_job.dataflow_job.id}"
}
*/


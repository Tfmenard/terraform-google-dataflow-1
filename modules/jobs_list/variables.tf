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

variable "job_name" {
  description = "(Required) The name of the dataflow job"
  default = ""
}

variable "template_gcs_path" {
  description = "(Required) The GCS path to the Dataflow job template."
  default = ""
}

variable "temp_gcs_location" {
  description = "(Required) A writeable location on GCS for the Dataflow job to dump its temporary data."
  default = ""
}

variable "parameters" {
  description = "(Optional) Key/Value pairs to be passed to the Dataflow job (as used in the template)."
  default     = {}
}

variable "max_workers" {
  description = "(Optional)  The number of workers permitted to work on the job. More workers may improve processing speed at additional cost."
  default     = "1"
}

variable "on_delete" {
  description = "(Optional) One of drain or cancel. Specifies behavior of deletion during terraform destroy. The default is cancel."
  default     = "cancel"
}

variable "project_id" {
  description = " (Optional) The project in which the resource belongs. If it is not provided, the provider project is used."
  default     = ""
}

variable "zone" {
  description = "(Optional) The zone in which the created job should run. If it is not provided, the provider zone is used."
  default     = "us-central1-a"
}

variable "bucket_region" {
  description = "BUCKET REGION"
  default     = "us-central1"
}

variable "jobs_list" {
  description = "The list of dataflow jobs"
  type = "list"
  /*
  default = [
    {
      job_name = ""
      template_gcs_path =  ""
      parameters = {},
      max_workers = ""
      on_delete = ""
      zone = ""
    }
  ]
  */
}

variable "is_jobs_list" {
  description = "Indicates whether the module if the module is used as a jobs list"
  default     = "false"
}

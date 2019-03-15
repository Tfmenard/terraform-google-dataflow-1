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

provider "google" {}

resource "random_id" "random_suffix" {
  byte_length = 4
}

resource "google_storage_bucket" "tmp_dir_bucket" {
  name          = "tmp-dir-bucket-${random_id.random_suffix.hex}"
  location      = "${var.region}"
  storage_class = "REGIONAL"
  project  = "${var.project_id}"
}

module "dataflow-job" {
  source      = "../../"
  project  = "${var.project_id}"
  #bucket_name = "${var.bucket_name}"
  job_name = "${var.job_name}"
  template_gcs_path =  "gs://dataflow-templates/latest/Word_Count"
  temp_gcs_location = "gs://${google_storage_bucket.tmp_dir_bucket.name}/tmp_dir"
}
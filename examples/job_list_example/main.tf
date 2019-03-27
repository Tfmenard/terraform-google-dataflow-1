provider "google" {}

resource "random_id" "random_suffix" {
  byte_length = 4
}

locals {
  gcs_bucket_name = "tmp-dir-bucket-${random_id.random_suffix.hex}"
}

module "dataflow-jobs" {
  source      = "../../modules/jobs_list"
  project_id  = "tfmenard-seed"
  temp_gcs_location = "${local.gcs_bucket_name}"
  /*
  on_delete         = "cancel"
  max_workers       = 1
  template_gcs_path = "gs://dataflow-templates/latest/Word_Count"
  temp_gcs_location = "${local.gcs_bucket_name}"
  #job_name = "some_job_name"
  parameters = {
    inputFile = "gs://dataflow-samples/shakespeare/kinglear.txt"
    output    = "gs://${local.gcs_bucket_name}/output/my_output"
  }
  */
  jobs_list = [
    {
        job_name = "wordcount-terraform-example"
        template_gcs_path =  "gs://dataflow-templates/latest/Word_Count"
        parameters =
        {
                inputFile = "gs://dataflow-samples/shakespeare/kinglear.txt"
                output   = "gs://<bucket_name>/output/my_output"
        }
        max_workers = 1
        on_delete = "cancel"
        zone = "us-central1-a"
    }
  ]
}

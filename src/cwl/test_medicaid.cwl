#!/usr/bin/env cwl-runner
### Full Medicaid Processing Pipeline

cwlVersion: v1.2
class: Workflow

requirements:
  SubworkflowFeatureRequirement: {}
  StepInputExpressionRequirement: {}
  InlineJavascriptRequirement: {}

doc: |
  This workflow ingests a small random subset of Medicaid MAX data
  and verifies counts

inputs:
  database:
    type: File
    default:
      class: File
      location: "/opt/airflow/project/database.ini"
    doc: Path to database connection file, usually database.ini
  connection_name:
    type: string
    default: nsaph_test
    doc: The name of the section in the database.ini file
  input:
    type: Directory
    default:
      class: Directory
      location: "/data/incoming/medicaid/mini_random_data/"

steps:
  process:
    run: medicaid.cwl
    in:
      database: database
      connection_name: connection_name
      input: input
    out:
      - resource1_log
      - resource2_log
      - parse_log
      - ps_reset_log
      - ps_create_log
      - ps_index_log
      - ps_vacuum_log
      - ip_reset_log
      - ip_create_log
      - ip_index_log
      - ip_vacuum_log
      - ben_create_log
      - ben_index_log
      - ben_vacuum_log
      - mnth_create_log
      - mnth_index_log
      - mnth_vacuum_log
      - enrlm_create_log
      - enrlm_index_log
      - enrlm_vacuum_log
      - elgb_prepare_log
      - elgb_create_log
      - elgb_index_log
      - elgb_vacuum_log
      - admissions_reset_log
      - admissions_create_log
      - admissions_index_log
      - admissions_vacuum_log
      - parse_err
      - ps_reset_err
      - ps_create_err
      - ps_index_err
      - ps_vacuum_err
      - ip_reset_err
      - ip_create_err
      - ip_index_err
      - ip_vacuum_err
      - ben_create_err
      - ben_index_err
      - ben_vacuum_err
      - mnth_create_err
      - mnth_index_err
      - mnth_vacuum_err
      - enrlm_create_err
      - enrlm_index_err
      - enrlm_vacuum_err
      - elgb_create_err
      - elgb_prepare_err
      - elgb_index_err
      - elgb_vacuum_err
      - admissions_reset_err
      - admissions_create_err
      - admissions_index_err
      - admissions_vacuum_err
  verify:
    run: verify.cwl
    in:
      database: database
      connection_name: connection_name
      depends_on: process/elgb_vacuum_log
    out:
      - log
      - errors

outputs:
  verification_log:
    type: File
    outputSource: verify/log
  verification_err:
    type: File
    outputSource: verify/errors

## From medicaid.cwl:
## Generated by nsaph/util/cwl_collect_outputs.py:
  resource1_log:
      type: File
      outputSource: process/resource1_log
  resource2_log:
      type: File
      outputSource: process/resource2_log
  parse_log:
      type: File?
      outputSource: process/parse_log
  ps_reset_log:
      type: File
      outputSource: process/ps_reset_log
  ps_create_log:
      type: File
      outputSource: process/ps_create_log
  ps_index_log:
      type: File
      outputSource: process/ps_index_log
  ps_vacuum_log:
      type: File
      outputSource: process/ps_vacuum_log
  ip_reset_log:
      type: File
      outputSource: process/ip_reset_log
  ip_create_log:
      type: File
      outputSource: process/ip_create_log
  ip_index_log:
      type: File
      outputSource: process/ip_index_log
  ip_vacuum_log:
      type: File
      outputSource: process/ip_vacuum_log
  ben_create_log:
      type: File
      outputSource: process/ben_create_log
  ben_index_log:
      type: File
      outputSource: process/ben_index_log
  ben_vacuum_log:
      type: File
      outputSource: process/ben_vacuum_log
  mnth_create_log:
      type: File
      outputSource: process/mnth_create_log
  mnth_index_log:
      type: File
      outputSource: process/mnth_index_log
  mnth_vacuum_log:
      type: File
      outputSource: process/mnth_vacuum_log
  enrlm_create_log:
      type: File
      outputSource: process/enrlm_create_log
  enrlm_index_log:
      type: File
      outputSource: process/enrlm_index_log
  enrlm_vacuum_log:
      type: File
      outputSource: process/enrlm_vacuum_log
  elgb_prepare_log:
      type: File
      outputSource: process/elgb_prepare_log
  elgb_create_log:
      type: File
      outputSource: process/elgb_create_log
  elgb_index_log:
      type: File
      outputSource: process/elgb_index_log
  elgb_vacuum_log:
      type: File
      outputSource: process/elgb_vacuum_log
  admissions_reset_log:
      type: File
      outputSource: process/admissions_reset_log
  admissions_create_log:
      type: File
      outputSource: process/admissions_create_log
  admissions_index_log:
      type: File
      outputSource: process/admissions_index_log
  admissions_vacuum_log:
      type: File
      outputSource: process/admissions_vacuum_log
  parse_err:
      type: File
      outputSource: process/parse_err
  ps_reset_err:
      type: File
      outputSource: process/ps_reset_err
  ps_create_err:
      type: File
      outputSource: process/ps_create_err
  ps_index_err:
      type: File
      outputSource: process/ps_index_err
  ps_vacuum_err:
      type: File
      outputSource: process/ps_vacuum_err
  ip_reset_err:
      type: File
      outputSource: process/ip_reset_err
  ip_create_err:
      type: File
      outputSource: process/ip_create_err
  ip_index_err:
      type: File
      outputSource: process/ip_index_err
  ip_vacuum_err:
      type: File
      outputSource: process/ip_vacuum_err
  ben_create_err:
      type: File
      outputSource: process/ben_create_err
  ben_index_err:
      type: File
      outputSource: process/ben_index_err
  ben_vacuum_err:
      type: File
      outputSource: process/ben_vacuum_err
  mnth_create_err:
      type: File
      outputSource: process/mnth_create_err
  mnth_index_err:
      type: File
      outputSource: process/mnth_index_err
  mnth_vacuum_err:
      type: File
      outputSource: process/mnth_vacuum_err
  enrlm_create_err:
      type: File
      outputSource: process/enrlm_create_err
  enrlm_index_err:
      type: File
      outputSource: process/enrlm_index_err
  enrlm_vacuum_err:
      type: File
      outputSource: process/enrlm_vacuum_err
  elgb_create_err:
      type: File
      outputSource: process/elgb_create_err
  elgb_prepare_err:
      type: File
      outputSource: process/elgb_prepare_err
  elgb_index_err:
      type: File
      outputSource: process/elgb_index_err
  elgb_vacuum_err:
      type: File
      outputSource: process/elgb_vacuum_err
  admissions_reset_err:
      type: File
      outputSource: process/admissions_reset_err
  admissions_create_err:
      type: File
      outputSource: process/admissions_create_err
  admissions_index_err:
      type: File
      outputSource: process/admissions_index_err
  admissions_vacuum_err:
      type: File
      outputSource: process/admissions_vacuum_err


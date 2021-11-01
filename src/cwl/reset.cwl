#!/usr/bin/env cwl-runner
### Generic Table (View/Materialized View) Initializer

cwlVersion: v1.2
class: CommandLineTool
baseCommand: [python, -m, nsaph.loader.data_loader]

doc: |
  This tool drops the tables and deletes all previous data from the database


inputs:
  registry:
    type: File
    inputBinding:
      prefix: --registry
    doc: |
      A path to the data model file
  domain:
    type: string
    default: cms
    doc: the name of the domain
    inputBinding:
      prefix: --domain
  table:
    type: string
    inputBinding:
      prefix: --table
    default: ps
    doc: the name of the table being deleted
  database:
    type: File
    doc: Path to database connection file, usually database.ini
    inputBinding:
      prefix: --db
  connection_name:
    type: string
    doc: The name of the section in the database.ini file
    inputBinding:
      prefix: --connection

arguments:
    - valueFrom: "--reset"


outputs:
  log:
    type: File
    outputBinding:
      glob: "*.log"

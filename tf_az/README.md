### Terraform

#### Syntax
Terraform support syntax like json where values are created in form of blocks and assigned as key and value.

It has following:
- arguments: assign a particular value to a identifier
- identifiers: a unique name within a block to defin a property or variable
- block: a block is created by brashes (like json) within it, another block or values can be assigned, after block type and name a label is defined to provide unique identification purpose
- comments: `//` or `#` for single line, `/*    */` for multiline comments


#### Files:
 - .tf - All terraform blocks are written into tf files which may include terraform basic types (e.g. providers, modules, resources etc.)
 - .tfstate - Current state of plan deployment
 - .lock.hcl - It contains hashes (for providers), created/updated at `terraform init`
 - .tfvars - provide value for variables

Rule applied on files:
 - read all .tf files in current directory or module source directory to evaluate terraform blocks
 - override - if a block is defined in a file, same block is defined in other file then the last definition will override the previous one and applied for each block like resource, variable etc.


#### Terraform Basic types:
##### Data Types
- string: string value
- bool: true or false boolean values used in conditions as well
- number: both whole and fractional numbers
- list: list of objects e.g. ["abc", "def"]
- map: key value pair e.g. {"key": "value"}
- null: no type value representing null

##### Variables
- [output](./outputs.tf): output variables to be printed as output
- [variable](./variables.tf): define the input variable to be used into the terraform code (can contain default value)
- [locals](./vnet/locals.tf): local (static kind) variable which is used throughout the code


##### Block types
- [providers](./providers.tf): providers by hashicorp for each clould vendors (like aws, azure, gpc etc.), custom providers can also be created
- [resource](./main.tf): resource block to be defined by providers to create actual cloud resource, it contains resource name and unique label and inside block properties with values
  Below are meta-arguments defined with resoruce blocks:
   - depends_on: for specifying hidden dependency
   - count: for creating multiple resource instances according to count
   - for_each: multiple instance according to list or map 
   - provider: for selecting non-defulat provider
   Apart form these there are other sub-blocks which often used:
   - `precondition { condition: "", message: "" }`: to set precondition
   - `timeout {create: "60m", delete: "2h"}`: set timeout before being considered to failed
- data: predefined data (mainly used for taking output from another deployment or predefined deployment by another terraform on which current deployment depends)
- [module](./main.tf): create a terraform module so that it can be reused
- checks: create health check and assertion
- import: import existing infra to terraform 

##### Expressions
 - type & values
 - string & templates
 - references to values
 - operators
 - functions calls
 - conditional expressions
 - for expressions
 - splat expressions
 - dynamic block
 - custom conditions
 - type constraints
 - version constraints

 ##### Functions
 - numeric functions
 - string functions
 - collection functions
 - encoding functions
 - filesystem functions
 - date & time functions 
 - hash & crypto functions
 - ip network functions 
 - type conversion functions 


 ##### Terraform commands
Main commands:
  init          Prepare your working directory for other commands
  validate      Check whether the configuration is valid
  plan          Show changes required by the current configuration
  apply         Create or update infrastructure
  destroy       Destroy previously-created infrastructure

All other commands:
  console       Try Terraform expressions at an interactive command prompt 
  fmt           Reformat your configuration in the standard style
  force-unlock  Release a stuck lock on the current workspace
  get           Install or upgrade remote Terraform modules
  graph         Generate a Graphviz graph of the steps in an operation     
  import        Associate existing infrastructure with a Terraform resource
  login         Obtain and save credentials for a remote host
  logout        Remove locally-stored credentials for a remote host
  metadata      Metadata related commands
  output        Show output values from your root module
  providers     Show the providers required for this configuration
  refresh       Update the state to match remote systems
  show          Show the current state or a saved plan
  state         Advanced state management
  taint         Mark a resource instance as not fully functional
  test          Experimental support for module integration testing
  untaint       Remove the 'tainted' state from a resource instance
  version       Show the current Terraform version
  workspace     Workspace management

Global options (use these before the subcommand, if any):
  -chdir=DIR    Switch to a different working directory before executing the
                given subcommand.
  -help         Show this help output, or the help for a specified subcommand.
  -version      An alias for the "version" subcommand.


##### Docs
https://developer.hashicorp.com/terraform/language

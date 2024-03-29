function Write-Log {
    Param(
      [Parameter(Mandatory=$true, Position=0)]
      [ValidateNotNullOrEmpty()]
      [string]$Message,
      [Parameter(Mandatory=$false, Position=1)]
      [ValidateSet('Error', 'Warning', 'Information', 'Verbose', 'Debug')]
      [string]$LogLevel = 'Information'
    )
  
    switch ($LogLevel) {
      'Error'       { ... }
      'Warning'     { ... }
      'Information' { ... }
      'Verbose'     { ... }
      'Debug'       { ... }
      default       { throw "Invalid log level: $_" }
    }
  }
name              "scafandru"
maintainer        "YOUR_NAME"
maintainer_email  "YOUR_EMAIL"
license           "All rights reserved"
description       "Installs/Configures scafandru"
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           "0.0.1"

depends           "artifact",   "~> 0.10.7"
depends           "tomcat",     "~> 0.11.0"
# depends           "mysql",      "~> 1.3.0" # provided by the "database" cookbook
depends           "database",   "~> 1.3.4"

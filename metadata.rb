name              "java"
maintainer        "Opscode, Inc."
maintainer_email  "cookbooks@opscode.com"
license           "Apache 2.0"
description       "Installs Java runtime."
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           "1.14.1"

recipe "java", "Installs Java runtime"
recipe "java::openjdk", "Installs the OpenJDK flavor of Java"
recipe "java::oracle", "Installs the Oracle flavor of Java"
recipe "java::oracle_i386", "Installs the 32-bit jvm without setting it as the default"
recipe "java::oracle_rpm", "Installs the Oracle RPM flavor of Java"

attribute "java/jdk_version",
  :display_name => "Java Version",
  :description => "The version to install",
  :recipes => [ 
      "java::oracle" 
  ]
  
attribute "java/oracle/accept_oracle_download_terms",
  :display_name => "Oracle License Override",
  :description => "Set to true to allow Oracle JDK to be installed and accept the license",
  :recipes => [ 
      "java::oracle" 
  ]  

%w{
    debian
    ubuntu
    centos
    redhat
    scientific
    fedora
    amazon
    arch
    oracle
    freebsd
    windows
    suse
    xenserver
    smartos
}.each do |os|
  supports os
end

depends "windows"
depends "aws"

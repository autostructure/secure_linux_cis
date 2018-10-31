
# secure_linux_cis

Welcome to your new module. A short overview of the generated parts can be found in the PDK documentation at https://puppet.com/pdk/latest/pdk_generating_modules.html .

The README template below provides a starting point with details about what information to include in your README.







#### Table of Contents

1. [Description](#description)
2. [Setup - The basics of getting started with secure_linux_cis](#setup)
    * [What secure_linux_cis affects](#what-secure_linux_cis-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with secure_linux_cis](#beginning-with-secure_linux_cis)
3. [Usage - Configuration options and additional functionality](#usage)
4. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Description

This Puppet module implements security controls defined in the Center for Internet Security (CIS) benchmarks for the below operating systems. The benchmark versions are listed below:

| Operating System | Benchmark Version |
|------------------|-------------------|
| RedHat 7 | 2.2.0 |
| CentOS 7 | 2.2.0 |

CIS Benchmarks can be found here.

## Setup

### What secure_linux_cis affects **OPTIONAL**

If it's obvious what your module touches, you can skip this section. For example, folks can probably figure out that your mysql_instance module affects their MySQL instances.

If there's more that they should know about, though, this is the place to mention:

* Files, packages, services, or operations that the module will alter, impact, or execute.
* Dependencies that your module automatically installs.
* Warnings or other important notices.

### Setup Requirements **OPTIONAL**

If your module requires anything extra before setting up (pluginsync enabled, another module, etc.), mention it here.

If your most recent release breaks compatibility or requires particular steps for upgrading, you might want to include an additional "Upgrading" section here.

### Beginning with secure_linux_cis

The very basic steps needed for a user to get the module up and running. This can include setup steps, if necessary, or it can be an example of the most basic use of the module.

## Usage

This section is where you describe how to customize, configure, and do the fancy stuff with your module here. It's especially helpful if you include usage examples and code samples for doing things with your module.

## Reference

Users need a complete list of your module's classes, types, defined types providers, facts, and functions, along with the parameters for each. You can provide this list either via Puppet Strings code comments or as a complete list in the README Reference section.

* If you are using Puppet Strings code comments, this Reference section should include Strings information so that your users know how to access your documentation.

* If you are not using Puppet Strings, include a list of all of your classes, defined types, and so on, along with their parameters. Each element in this listing should include:

  * The data type, if applicable.
  * A description of what the element does.
  * Valid values, if the data type doesn't make it obvious.
  * Default value, if any.

## Limitations

Some things we just can not enforce :(

### 1.1.18
For all removable media partitions, make sure that the "nodev" option is set

### 1.1.19
For all removable media partitions, make sure that the "nosuid" option is set

### 1.1.20
For all removable media partitions, make sure that the "noexec" option is set

### 1.2.4
Please verify that your system is connected to the Red Hat Subscription Manager

### 6.1.1
Utilize the RPM package manager to ensure that system packages have been installed properly, and files have correct permissions to the OS

### 6.1.10
Ensure no world-writable files exist in network mounted partitions. We can only check the local filesystem

### 6.2.1
Lock any accounts that do not have passwords for review


## Development

Since your module is awesome, other users will want to play with it. Let them know what the ground rules for contributing are.

## Release Notes/Contributors/Etc. **Optional**

If you aren't using changelog, put your release notes here (though you should consider using changelog). You can also add any additional sections you feel are necessary or important to include here. Please use the `## ` header.

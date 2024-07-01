### README.md

# DevOps_Terraform_SFTP server

This repository contains various scripts and configuration files necessary for setting up and managing infrastructure using Terraform and other tools.

## Table of Contents
- [Getting Started](#getting-started)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Usage](#usage)
- [Scripts](#scripts)
- [Project Description](#project-description)


## Getting Started

These instructions will guide you through the setup and use of this project.

## Prerequisites

Before you begin, ensure you have met the following requirements:
- You have a Unix-based operating system.
- You have installed the latest version of Terraform. You can find installation instructions on the official Terraform website.
- You have an AWS account for managing S3 backups.
- You have `git` installed to pull the project files.

## Installation

Follow these steps to get your environment set up:

1. **Update Server Software:** Ensure your server software is up to date.

2. **Install Terraform:** Refer to the official Terraform documentation for detailed installation steps.

3. **Check Terraform Version:** Verify that Terraform is installed correctly.

4. **Clone the Repository:** Navigate to your home directory, create a project directory, and clone the repository from GitHub.

## Usage

### Terraform Commands
To manage your infrastructure, use the following Terraform commands:
- Initialize Terraform.
- Plan Terraform Changes.
- Apply Terraform Changes.
- Destroy Terraform Managed Infrastructure.

## Scripts

This repository includes several scripts for different purposes:

1. **Backup Script:** This script creates backups of the `/opt` directory and uploads them to an S3 bucket. It runs every minute.

2. **User Script:** This script creates a new user for the SFTP server and sets up necessary configurations.

3. **SFTP Script:** This script sets the SFTP server port to 15955 and configures iptables to allow access.

4. **Commands File:** This file includes a list of commands to set up the project environment and run Terraform.

## Project Description

As a junior DevOps engineer, you need to create Infrastructure as a Code for our SFTP server.

### Requirements:
- Use the default VPC in the Frankfurt region.
- The SFTP server should listen on port 15955.
- This port must be available only from the local network and the private IP address of the executor.
- The SFTP server must be available only for the user "admin".
- An S3 bucket should be used to back up the `/opt/*` directory from the SFTP server.
- A backup must be done every minute and overwrite files with the same names.


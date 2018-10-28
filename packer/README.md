packer=1.3.1.linux.amd64.zip

To build an ami, simply do a `packer build ./<directory>/image.json`

Having a variable file or passing in the vars in the command line might be easier than updating all of the packer templates to "hard code" it into the template. You can do so via `-var-file=vars.json -var aws_region=us-east-1`


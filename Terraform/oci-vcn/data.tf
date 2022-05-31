# statements to fetch required data from OCI

data "oci_core_vcn" "test_vcn" {
    #Required
    vcn_id = module.vcn.vcn_id
}
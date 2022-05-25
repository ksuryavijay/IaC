#

data "oci_core_vcn" "test_vcn" {
    #Required
    vcn_id = oci_core_vcn.test_vcn.id
}

output vnc_ocid {
    value = data.oci_core_vcn.test_vcn.vcn_id
}
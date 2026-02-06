set SynModuleInfo {
  {SRCNAME generate_subkeys MODELNAME generate_subkeys RTLNAME des_encrypt_generate_subkeys}
  {SRCNAME des_core MODELNAME des_core RTLNAME des_encrypt_des_core
    SUBMODULES {
      {MODELNAME des_encrypt_sparsemux_33_4_4_1_1 RTLNAME des_encrypt_sparsemux_33_4_4_1_1 BINDTYPE op TYPE sparsemux IMPL compactencoding_dontcare}
      {MODELNAME des_encrypt_sparsemux_9_2_4_1_1 RTLNAME des_encrypt_sparsemux_9_2_4_1_1 BINDTYPE op TYPE sparsemux IMPL compactencoding_dontcare}
    }
  }
  {SRCNAME des_encrypt MODELNAME des_encrypt RTLNAME des_encrypt IS_TOP 1}
}

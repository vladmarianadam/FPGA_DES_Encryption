# 2026-02-04T11:38:45.777144900
import vitis

client = vitis.create_client()
client.set_workspace(path="PDC_Project")

comp = client.create_hls_component(name = "hls_component",cfg_file = ["hls_config.cfg"],template = "empty_hls_component")

vitis.dispose()


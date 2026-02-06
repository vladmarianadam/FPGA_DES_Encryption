# 2026-02-05T17:46:10.290457
import vitis

client = vitis.create_client()
client.set_workspace(path="PDC_Project")

cfg = client.get_config_file(path="C:\02_work\PDC\PDC_Project\hls_component\hls_config.cfg")

cfg.set_values(key="syn.file", values=["des.h"])

cfg.set_values(key="syn.file", values=["des.h", "des.cpp"])


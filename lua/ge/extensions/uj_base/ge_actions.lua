local a={}local b;local function c()if b.restrictActions then extensions.core_input_actionFilter.setGroup('uj_base',b.disabledActions)extensions.core_input_actionFilter.addAction(0,'uj_base',true)end end;local function d()b=require("settings/config")c()end;local function e()extensions.core_input_actionFilter.addAction(0,'uj_base',false)end;a.onExtensionLoaded=d;a.onExtensionUnloaded=e;return a
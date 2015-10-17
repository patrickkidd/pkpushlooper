{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 6,
			"minor" : 1,
			"revision" : 10,
			"architecture" : "x86"
		}
,
		"rect" : [ 50.0, 45.0, 190.0, 180.0 ],
		"bglocked" : 0,
		"openinpresentation" : 1,
		"default_fontsize" : 10.0,
		"default_fontface" : 0,
		"default_fontname" : "Arial Bold",
		"gridonopen" : 0,
		"gridsize" : [ 15.0, 15.0 ],
		"gridsnaponopen" : 0,
		"statusbarvisible" : 2,
		"toolbarvisible" : 1,
		"boxanimatetime" : 200,
		"imprint" : 0,
		"enablehscroll" : 1,
		"enablevscroll" : 1,
		"devicewidth" : 0.0,
		"description" : "",
		"digest" : "",
		"tags" : "",
		"boxes" : [ 			{
				"box" : 				{
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-326",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 512.0, 498.0, 117.0, 16.0 ],
					"text" : "window size 175 175"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-262",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 512.0, 549.0, 100.0, 18.0 ],
					"save" : [ "#N", "thispatcher", ";", "#Q", "end", ";" ],
					"text" : "thispatcher"
				}

			}
, 			{
				"box" : 				{
					"comment" : "Show floating UI window",
					"id" : "obj-261",
					"maxclass" : "inlet",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 512.0, 450.0, 25.0, 25.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 11.595187,
					"id" : "obj-25",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 645.0, 498.0, 273.0, 17.0 ],
					"text" : "window size 100 400 800 1600, front, window exec"
				}

			}
, 			{
				"box" : 				{
					"comment" : "",
					"id" : "obj-260",
					"maxclass" : "outlet",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 28.0, 550.0, 25.0, 25.0 ]
				}

			}
, 			{
				"box" : 				{
					"comment" : "",
					"id" : "obj-259",
					"maxclass" : "inlet",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 28.0, 458.0, 25.0, 25.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-325",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 28.0, 506.0, 100.0, 18.0 ],
					"saved_object_attributes" : 					{
						"filename" : "pk.push_ui",
						"parameter_enable" : 0
					}
,
					"text" : "js pk.push_ui"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-133",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 403.0, 984.0, 68.0, 18.0 ],
					"text" : "prepend 63"
				}

			}
, 			{
				"box" : 				{
					"checkedcolor" : [ 0.0, 0.0, 0.0, 0.0 ],
					"id" : "obj-134",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 403.0, 898.0, 20.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 154.0, 148.0, 20.0, 20.0 ],
					"varname" : "b_63"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-135",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 379.0, 966.0, 68.0, 18.0 ],
					"text" : "prepend 62"
				}

			}
, 			{
				"box" : 				{
					"checkedcolor" : [ 0.0, 0.0, 0.0, 0.0 ],
					"id" : "obj-136",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 379.0, 898.0, 20.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 133.0, 148.0, 20.0, 20.0 ],
					"varname" : "b_62"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-137",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 355.0, 948.0, 68.0, 18.0 ],
					"text" : "prepend 61"
				}

			}
, 			{
				"box" : 				{
					"checkedcolor" : [ 0.0, 0.0, 0.0, 0.0 ],
					"id" : "obj-138",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 355.0, 898.0, 20.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 111.0, 148.0, 20.0, 20.0 ],
					"varname" : "b_61"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-139",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 331.0, 930.0, 68.0, 18.0 ],
					"text" : "prepend 60"
				}

			}
, 			{
				"box" : 				{
					"checkedcolor" : [ 0.0, 0.0, 0.0, 0.0 ],
					"id" : "obj-140",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 331.0, 898.0, 20.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 89.0, 148.0, 20.0, 20.0 ],
					"varname" : "b_60"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-141",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 267.0, 984.0, 68.0, 18.0 ],
					"text" : "prepend 59"
				}

			}
, 			{
				"box" : 				{
					"checkedcolor" : [ 0.0, 0.0, 0.0, 0.0 ],
					"id" : "obj-142",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 267.0, 898.0, 20.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 66.0, 148.0, 20.0, 20.0 ],
					"varname" : "b_59"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-143",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 243.0, 966.0, 68.0, 18.0 ],
					"text" : "prepend 58"
				}

			}
, 			{
				"box" : 				{
					"checkedcolor" : [ 0.0, 0.0, 0.0, 0.0 ],
					"id" : "obj-144",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 243.0, 898.0, 20.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 44.0, 148.0, 20.0, 20.0 ],
					"varname" : "b_58"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-145",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 219.0, 948.0, 68.0, 18.0 ],
					"text" : "prepend 57"
				}

			}
, 			{
				"box" : 				{
					"checkedcolor" : [ 0.0, 0.0, 0.0, 0.0 ],
					"id" : "obj-146",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 219.0, 898.0, 20.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 22.0, 148.0, 20.0, 20.0 ],
					"varname" : "b_57"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-147",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 195.0, 930.0, 68.0, 18.0 ],
					"text" : "prepend 56"
				}

			}
, 			{
				"box" : 				{
					"checkedcolor" : [ 0.0, 0.0, 0.0, 0.0 ],
					"id" : "obj-148",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 195.0, 898.0, 20.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 0.0, 148.0, 20.0, 20.0 ],
					"varname" : "b_56"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-149",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 403.0, 861.0, 68.0, 18.0 ],
					"text" : "prepend 55"
				}

			}
, 			{
				"box" : 				{
					"checkedcolor" : [ 0.0, 0.0, 0.0, 0.0 ],
					"id" : "obj-150",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 403.0, 775.0, 20.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 154.0, 127.0, 20.0, 20.0 ],
					"varname" : "b_55"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-151",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 379.0, 843.0, 68.0, 18.0 ],
					"text" : "prepend 54"
				}

			}
, 			{
				"box" : 				{
					"checkedcolor" : [ 0.0, 0.0, 0.0, 0.0 ],
					"id" : "obj-152",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 379.0, 775.0, 20.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 133.0, 127.0, 20.0, 20.0 ],
					"varname" : "b_54"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-153",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 355.0, 825.0, 68.0, 18.0 ],
					"text" : "prepend 53"
				}

			}
, 			{
				"box" : 				{
					"checkedcolor" : [ 0.0, 0.0, 0.0, 0.0 ],
					"id" : "obj-154",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 355.0, 775.0, 20.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 111.0, 127.0, 20.0, 20.0 ],
					"varname" : "b_53"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-155",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 331.0, 807.0, 68.0, 18.0 ],
					"text" : "prepend 52"
				}

			}
, 			{
				"box" : 				{
					"checkedcolor" : [ 0.0, 0.0, 0.0, 0.0 ],
					"id" : "obj-156",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 331.0, 775.0, 20.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 89.0, 127.0, 20.0, 20.0 ],
					"varname" : "b_52"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-157",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 267.0, 861.0, 68.0, 18.0 ],
					"text" : "prepend 51"
				}

			}
, 			{
				"box" : 				{
					"checkedcolor" : [ 0.0, 0.0, 0.0, 0.0 ],
					"id" : "obj-158",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 267.0, 775.0, 20.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 66.0, 127.0, 20.0, 20.0 ],
					"varname" : "b_51"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-159",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 243.0, 843.0, 68.0, 18.0 ],
					"text" : "prepend 50"
				}

			}
, 			{
				"box" : 				{
					"checkedcolor" : [ 0.0, 0.0, 0.0, 0.0 ],
					"id" : "obj-160",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 243.0, 775.0, 20.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 44.0, 127.0, 20.0, 20.0 ],
					"varname" : "b_50"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-161",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 219.0, 825.0, 68.0, 18.0 ],
					"text" : "prepend 49"
				}

			}
, 			{
				"box" : 				{
					"checkedcolor" : [ 0.0, 0.0, 0.0, 0.0 ],
					"id" : "obj-162",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 219.0, 775.0, 20.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 22.0, 127.0, 20.0, 20.0 ],
					"varname" : "b_49"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-163",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 195.0, 807.0, 68.0, 18.0 ],
					"text" : "prepend 48"
				}

			}
, 			{
				"box" : 				{
					"checkedcolor" : [ 0.0, 0.0, 0.0, 0.0 ],
					"id" : "obj-164",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 195.0, 775.0, 20.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 0.0, 127.0, 20.0, 20.0 ],
					"varname" : "b_48"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-165",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 403.0, 737.0, 68.0, 18.0 ],
					"text" : "prepend 47"
				}

			}
, 			{
				"box" : 				{
					"checkedcolor" : [ 0.0, 0.0, 0.0, 0.0 ],
					"id" : "obj-166",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 403.0, 651.0, 20.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 154.0, 106.0, 20.0, 20.0 ],
					"varname" : "b_47"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-167",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 379.0, 719.0, 68.0, 18.0 ],
					"text" : "prepend 46"
				}

			}
, 			{
				"box" : 				{
					"checkedcolor" : [ 0.0, 0.0, 0.0, 0.0 ],
					"id" : "obj-168",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 379.0, 651.0, 20.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 133.0, 106.0, 20.0, 20.0 ],
					"varname" : "b_46"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-169",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 355.0, 701.0, 68.0, 18.0 ],
					"text" : "prepend 45"
				}

			}
, 			{
				"box" : 				{
					"checkedcolor" : [ 0.0, 0.0, 0.0, 0.0 ],
					"id" : "obj-170",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 355.0, 651.0, 20.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 111.0, 106.0, 20.0, 20.0 ],
					"varname" : "b_45"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-171",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 331.0, 683.0, 68.0, 18.0 ],
					"text" : "prepend 44"
				}

			}
, 			{
				"box" : 				{
					"checkedcolor" : [ 0.0, 0.0, 0.0, 0.0 ],
					"id" : "obj-172",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 331.0, 651.0, 20.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 89.0, 106.0, 20.0, 20.0 ],
					"varname" : "b_44"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-173",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 267.0, 737.0, 68.0, 18.0 ],
					"text" : "prepend 43"
				}

			}
, 			{
				"box" : 				{
					"checkedcolor" : [ 0.0, 0.0, 0.0, 0.0 ],
					"id" : "obj-174",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 267.0, 651.0, 20.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 66.0, 106.0, 20.0, 20.0 ],
					"varname" : "b_43"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-175",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 243.0, 719.0, 68.0, 18.0 ],
					"text" : "prepend 42"
				}

			}
, 			{
				"box" : 				{
					"checkedcolor" : [ 0.0, 0.0, 0.0, 0.0 ],
					"id" : "obj-176",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 243.0, 651.0, 20.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 44.0, 106.0, 20.0, 20.0 ],
					"varname" : "b_42"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-177",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 219.0, 701.0, 68.0, 18.0 ],
					"text" : "prepend 41"
				}

			}
, 			{
				"box" : 				{
					"checkedcolor" : [ 0.0, 0.0, 0.0, 0.0 ],
					"id" : "obj-178",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 219.0, 651.0, 20.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 22.0, 106.0, 20.0, 20.0 ],
					"varname" : "b_41"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-179",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 195.0, 683.0, 68.0, 18.0 ],
					"text" : "prepend 40"
				}

			}
, 			{
				"box" : 				{
					"checkedcolor" : [ 0.0, 0.0, 0.0, 0.0 ],
					"id" : "obj-180",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 195.0, 651.0, 20.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 0.0, 106.0, 20.0, 20.0 ],
					"varname" : "b_40"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-181",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 403.0, 617.0, 68.0, 18.0 ],
					"text" : "prepend 39"
				}

			}
, 			{
				"box" : 				{
					"checkedcolor" : [ 0.0, 0.0, 0.0, 0.0 ],
					"id" : "obj-182",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 403.0, 531.0, 20.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 154.0, 85.0, 20.0, 20.0 ],
					"varname" : "b_39"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-183",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 379.0, 599.0, 68.0, 18.0 ],
					"text" : "prepend 38"
				}

			}
, 			{
				"box" : 				{
					"checkedcolor" : [ 0.0, 0.0, 0.0, 0.0 ],
					"id" : "obj-184",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 379.0, 531.0, 20.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 133.0, 85.0, 20.0, 20.0 ],
					"varname" : "b_38"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-185",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 355.0, 581.0, 68.0, 18.0 ],
					"text" : "prepend 37"
				}

			}
, 			{
				"box" : 				{
					"checkedcolor" : [ 0.0, 0.0, 0.0, 0.0 ],
					"id" : "obj-186",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 355.0, 531.0, 20.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 111.0, 85.0, 20.0, 20.0 ],
					"varname" : "b_37"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-187",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 331.0, 563.0, 68.0, 18.0 ],
					"text" : "prepend 36"
				}

			}
, 			{
				"box" : 				{
					"checkedcolor" : [ 0.0, 0.0, 0.0, 0.0 ],
					"id" : "obj-188",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 331.0, 531.0, 20.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 89.0, 85.0, 20.0, 20.0 ],
					"varname" : "b_36"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-189",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 267.0, 617.0, 68.0, 18.0 ],
					"text" : "prepend 35"
				}

			}
, 			{
				"box" : 				{
					"checkedcolor" : [ 0.0, 0.0, 0.0, 0.0 ],
					"id" : "obj-190",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 267.0, 531.0, 20.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 66.0, 85.0, 20.0, 20.0 ],
					"varname" : "b_35"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-191",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 243.0, 599.0, 68.0, 18.0 ],
					"text" : "prepend 34"
				}

			}
, 			{
				"box" : 				{
					"checkedcolor" : [ 0.0, 0.0, 0.0, 0.0 ],
					"id" : "obj-192",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 243.0, 531.0, 20.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 44.0, 85.0, 20.0, 20.0 ],
					"varname" : "b_34"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-193",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 219.0, 581.0, 68.0, 18.0 ],
					"text" : "prepend 33"
				}

			}
, 			{
				"box" : 				{
					"checkedcolor" : [ 0.0, 0.0, 0.0, 0.0 ],
					"id" : "obj-194",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 219.0, 531.0, 20.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 22.0, 85.0, 20.0, 20.0 ],
					"varname" : "b_33"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-195",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 195.0, 563.0, 68.0, 18.0 ],
					"text" : "prepend 32"
				}

			}
, 			{
				"box" : 				{
					"checkedcolor" : [ 0.0, 0.0, 0.0, 0.0 ],
					"id" : "obj-196",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 195.0, 531.0, 20.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 0.0, 85.0, 20.0, 20.0 ],
					"varname" : "b_32"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-101",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 403.0, 493.0, 68.0, 18.0 ],
					"text" : "prepend 31"
				}

			}
, 			{
				"box" : 				{
					"checkedcolor" : [ 0.0, 0.0, 0.0, 0.0 ],
					"id" : "obj-102",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 403.0, 407.0, 20.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 154.0, 63.0, 20.0, 20.0 ],
					"varname" : "b_31"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-103",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 379.0, 475.0, 68.0, 18.0 ],
					"text" : "prepend 30"
				}

			}
, 			{
				"box" : 				{
					"checkedcolor" : [ 0.0, 0.0, 0.0, 0.0 ],
					"id" : "obj-104",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 379.0, 407.0, 20.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 133.0, 63.0, 20.0, 20.0 ],
					"varname" : "b_30"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-105",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 355.0, 457.0, 68.0, 18.0 ],
					"text" : "prepend 29"
				}

			}
, 			{
				"box" : 				{
					"checkedcolor" : [ 0.0, 0.0, 0.0, 0.0 ],
					"id" : "obj-106",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 355.0, 407.0, 20.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 111.0, 63.0, 20.0, 20.0 ],
					"varname" : "b_29"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-107",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 331.0, 439.0, 68.0, 18.0 ],
					"text" : "prepend 28"
				}

			}
, 			{
				"box" : 				{
					"checkedcolor" : [ 0.0, 0.0, 0.0, 0.0 ],
					"id" : "obj-108",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 331.0, 407.0, 20.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 89.0, 63.0, 20.0, 20.0 ],
					"varname" : "b_28"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-109",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 267.0, 493.0, 68.0, 18.0 ],
					"text" : "prepend 27"
				}

			}
, 			{
				"box" : 				{
					"checkedcolor" : [ 0.0, 0.0, 0.0, 0.0 ],
					"id" : "obj-110",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 267.0, 407.0, 20.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 66.0, 63.0, 20.0, 20.0 ],
					"varname" : "b_27"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-111",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 243.0, 475.0, 68.0, 18.0 ],
					"text" : "prepend 26"
				}

			}
, 			{
				"box" : 				{
					"checkedcolor" : [ 0.0, 0.0, 0.0, 0.0 ],
					"id" : "obj-112",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 243.0, 407.0, 20.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 44.0, 63.0, 20.0, 20.0 ],
					"varname" : "b_26"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-113",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 219.0, 457.0, 68.0, 18.0 ],
					"text" : "prepend 25"
				}

			}
, 			{
				"box" : 				{
					"checkedcolor" : [ 0.0, 0.0, 0.0, 0.0 ],
					"id" : "obj-114",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 219.0, 407.0, 20.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 22.0, 63.0, 20.0, 20.0 ],
					"varname" : "b_25"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-115",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 195.0, 439.0, 68.0, 18.0 ],
					"text" : "prepend 24"
				}

			}
, 			{
				"box" : 				{
					"checkedcolor" : [ 0.0, 0.0, 0.0, 0.0 ],
					"id" : "obj-116",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 195.0, 407.0, 20.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 0.0, 63.0, 20.0, 20.0 ],
					"varname" : "b_24"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-117",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 403.0, 367.0, 68.0, 18.0 ],
					"text" : "prepend 23"
				}

			}
, 			{
				"box" : 				{
					"checkedcolor" : [ 0.0, 0.0, 0.0, 0.0 ],
					"id" : "obj-118",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 403.0, 281.0, 20.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 154.0, 42.0, 20.0, 20.0 ],
					"varname" : "b_23"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-119",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 379.0, 349.0, 68.0, 18.0 ],
					"text" : "prepend 22"
				}

			}
, 			{
				"box" : 				{
					"checkedcolor" : [ 0.0, 0.0, 0.0, 0.0 ],
					"id" : "obj-120",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 379.0, 281.0, 20.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 133.0, 42.0, 20.0, 20.0 ],
					"varname" : "b_22"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-121",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 355.0, 331.0, 68.0, 18.0 ],
					"text" : "prepend 21"
				}

			}
, 			{
				"box" : 				{
					"checkedcolor" : [ 0.0, 0.0, 0.0, 0.0 ],
					"id" : "obj-122",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 355.0, 281.0, 20.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 111.0, 42.0, 20.0, 20.0 ],
					"varname" : "b_21"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-123",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 331.0, 313.0, 68.0, 18.0 ],
					"text" : "prepend 20"
				}

			}
, 			{
				"box" : 				{
					"checkedcolor" : [ 0.0, 0.0, 0.0, 0.0 ],
					"id" : "obj-124",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 331.0, 281.0, 20.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 89.0, 42.0, 20.0, 20.0 ],
					"varname" : "b_20"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-125",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 267.0, 367.0, 68.0, 18.0 ],
					"text" : "prepend 19"
				}

			}
, 			{
				"box" : 				{
					"checkedcolor" : [ 0.0, 0.0, 0.0, 0.0 ],
					"id" : "obj-126",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 267.0, 281.0, 20.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 66.0, 42.0, 20.0, 20.0 ],
					"varname" : "b_19"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-127",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 243.0, 349.0, 68.0, 18.0 ],
					"text" : "prepend 18"
				}

			}
, 			{
				"box" : 				{
					"checkedcolor" : [ 0.0, 0.0, 0.0, 0.0 ],
					"id" : "obj-128",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 243.0, 281.0, 20.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 44.0, 42.0, 20.0, 20.0 ],
					"varname" : "b_18"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-129",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 219.0, 331.0, 68.0, 18.0 ],
					"text" : "prepend 17"
				}

			}
, 			{
				"box" : 				{
					"checkedcolor" : [ 0.0, 0.0, 0.0, 0.0 ],
					"id" : "obj-130",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 219.0, 281.0, 20.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 22.0, 42.0, 20.0, 20.0 ],
					"varname" : "b_17"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-131",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 195.0, 313.0, 68.0, 18.0 ],
					"text" : "prepend 16"
				}

			}
, 			{
				"box" : 				{
					"checkedcolor" : [ 0.0, 0.0, 0.0, 0.0 ],
					"id" : "obj-132",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 195.0, 281.0, 20.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 0.0, 42.0, 20.0, 20.0 ],
					"varname" : "b_16"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-85",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 403.0, 238.0, 68.0, 18.0 ],
					"text" : "prepend 15"
				}

			}
, 			{
				"box" : 				{
					"checkedcolor" : [ 0.0, 0.0, 0.0, 0.0 ],
					"id" : "obj-86",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 403.0, 152.0, 20.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 154.0, 21.0, 20.0, 20.0 ],
					"varname" : "b_15"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-87",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 379.0, 220.0, 68.0, 18.0 ],
					"text" : "prepend 14"
				}

			}
, 			{
				"box" : 				{
					"checkedcolor" : [ 0.0, 0.0, 0.0, 0.0 ],
					"id" : "obj-88",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 379.0, 152.0, 20.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 133.0, 21.0, 20.0, 20.0 ],
					"varname" : "b_14"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-89",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 355.0, 202.0, 68.0, 18.0 ],
					"text" : "prepend 13"
				}

			}
, 			{
				"box" : 				{
					"checkedcolor" : [ 0.0, 0.0, 0.0, 0.0 ],
					"id" : "obj-90",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 355.0, 152.0, 20.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 111.0, 21.0, 20.0, 20.0 ],
					"varname" : "b_13"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-91",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 331.0, 184.0, 68.0, 18.0 ],
					"text" : "prepend 12"
				}

			}
, 			{
				"box" : 				{
					"checkedcolor" : [ 0.0, 0.0, 0.0, 0.0 ],
					"id" : "obj-92",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 331.0, 152.0, 20.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 89.0, 21.0, 20.0, 20.0 ],
					"varname" : "b_12"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-93",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 267.0, 238.0, 68.0, 18.0 ],
					"text" : "prepend 11"
				}

			}
, 			{
				"box" : 				{
					"checkedcolor" : [ 0.0, 0.0, 0.0, 0.0 ],
					"id" : "obj-94",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 267.0, 152.0, 20.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 66.0, 21.0, 20.0, 20.0 ],
					"varname" : "b_11"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-95",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 243.0, 220.0, 68.0, 18.0 ],
					"text" : "prepend 10"
				}

			}
, 			{
				"box" : 				{
					"checkedcolor" : [ 0.0, 0.0, 0.0, 0.0 ],
					"id" : "obj-96",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 243.0, 152.0, 20.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 44.0, 21.0, 20.0, 20.0 ],
					"varname" : "b_10"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-97",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 219.0, 202.0, 68.0, 18.0 ],
					"text" : "prepend 9"
				}

			}
, 			{
				"box" : 				{
					"checkedcolor" : [ 0.0, 0.0, 0.0, 0.0 ],
					"id" : "obj-98",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 219.0, 152.0, 20.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 22.0, 21.0, 20.0, 20.0 ],
					"varname" : "b_9"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-99",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 195.0, 184.0, 68.0, 18.0 ],
					"text" : "prepend 8"
				}

			}
, 			{
				"box" : 				{
					"checkedcolor" : [ 0.0, 0.0, 0.0, 0.0 ],
					"id" : "obj-100",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 195.0, 152.0, 20.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 0.0, 21.0, 20.0, 20.0 ],
					"varname" : "b_8"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-77",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 403.0, 115.0, 68.0, 18.0 ],
					"text" : "prepend 7"
				}

			}
, 			{
				"box" : 				{
					"checkedcolor" : [ 0.0, 0.0, 0.0, 0.0 ],
					"id" : "obj-78",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 403.0, 29.0, 20.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 154.0, 0.0, 20.0, 20.0 ],
					"varname" : "b_7"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-79",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 379.0, 97.0, 68.0, 18.0 ],
					"text" : "prepend 6"
				}

			}
, 			{
				"box" : 				{
					"checkedcolor" : [ 0.0, 0.0, 0.0, 0.0 ],
					"id" : "obj-80",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 379.0, 29.0, 20.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 133.0, 0.0, 20.0, 20.0 ],
					"varname" : "b_6"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-81",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 355.0, 79.0, 68.0, 18.0 ],
					"text" : "prepend 5"
				}

			}
, 			{
				"box" : 				{
					"checkedcolor" : [ 0.0, 0.0, 0.0, 0.0 ],
					"id" : "obj-82",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 355.0, 29.0, 20.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 111.0, 0.0, 20.0, 20.0 ],
					"varname" : "b_5"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-83",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 331.0, 61.0, 68.0, 18.0 ],
					"text" : "prepend 4"
				}

			}
, 			{
				"box" : 				{
					"checkedcolor" : [ 0.0, 0.0, 0.0, 0.0 ],
					"id" : "obj-84",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 331.0, 29.0, 20.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 89.0, 0.0, 20.0, 20.0 ],
					"varname" : "b_4"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-73",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 267.0, 115.0, 68.0, 18.0 ],
					"text" : "prepend 3"
				}

			}
, 			{
				"box" : 				{
					"checkedcolor" : [ 0.0, 0.0, 0.0, 0.0 ],
					"id" : "obj-74",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 267.0, 29.0, 20.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 66.0, 0.0, 20.0, 20.0 ],
					"varname" : "b_3"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-75",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 243.0, 97.0, 68.0, 18.0 ],
					"text" : "prepend 2"
				}

			}
, 			{
				"box" : 				{
					"checkedcolor" : [ 0.0, 0.0, 0.0, 0.0 ],
					"id" : "obj-76",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 243.0, 29.0, 20.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 44.0, 0.0, 20.0, 20.0 ],
					"varname" : "b_2"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-71",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 219.0, 79.0, 68.0, 18.0 ],
					"text" : "prepend 1"
				}

			}
, 			{
				"box" : 				{
					"checkedcolor" : [ 0.0, 0.0, 0.0, 0.0 ],
					"id" : "obj-72",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 219.0, 29.0, 20.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 22.0, 0.0, 20.0, 20.0 ],
					"varname" : "b_1"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-69",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 195.0, 61.0, 68.0, 18.0 ],
					"text" : "prepend 0"
				}

			}
, 			{
				"box" : 				{
					"checkedcolor" : [ 0.0, 0.0, 0.0, 0.0 ],
					"id" : "obj-2",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 195.0, 29.0, 20.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 0.0, 0.0, 20.0, 20.0 ],
					"varname" : "b_0"
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-99", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-100", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-325", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 412.5, 513.0, 138.0, 513.0, 138.0, 492.0, 37.5, 492.0 ],
					"source" : [ "obj-101", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-101", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-102", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-325", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 388.5, 513.0, 138.0, 513.0, 138.0, 492.0, 37.5, 492.0 ],
					"source" : [ "obj-103", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-103", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-104", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-325", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 364.5, 513.0, 138.0, 513.0, 138.0, 492.0, 37.5, 492.0 ],
					"source" : [ "obj-105", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-105", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-106", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-325", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 340.5, 513.0, 138.0, 513.0, 138.0, 492.0, 37.5, 492.0 ],
					"source" : [ "obj-107", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-107", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-108", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-325", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 276.5, 513.0, 138.0, 513.0, 138.0, 492.0, 37.5, 492.0 ],
					"source" : [ "obj-109", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-109", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-110", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-325", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 252.5, 504.0, 129.0, 504.0, 129.0, 501.0, 37.5, 501.0 ],
					"source" : [ "obj-111", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-111", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-112", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-325", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 228.5, 492.0, 37.5, 492.0 ],
					"source" : [ "obj-113", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-113", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-114", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-325", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 204.5, 492.0, 37.5, 492.0 ],
					"source" : [ "obj-115", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-115", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-116", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-325", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 412.5, 387.0, 63.0, 387.0, 63.0, 501.0, 37.5, 501.0 ],
					"source" : [ "obj-117", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-117", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-118", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-325", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 388.5, 393.0, 63.0, 393.0, 63.0, 501.0, 37.5, 501.0 ],
					"source" : [ "obj-119", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-119", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-120", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-325", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 364.5, 393.0, 63.0, 393.0, 63.0, 501.0, 37.5, 501.0 ],
					"source" : [ "obj-121", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-121", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-122", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-325", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 340.5, 387.0, 63.0, 387.0, 63.0, 501.0, 37.5, 501.0 ],
					"source" : [ "obj-123", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-123", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-124", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-325", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 276.5, 387.0, 63.0, 387.0, 63.0, 501.0, 37.5, 501.0 ],
					"source" : [ "obj-125", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-125", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-126", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-325", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 252.5, 393.0, 63.0, 393.0, 63.0, 501.0, 37.5, 501.0 ],
					"source" : [ "obj-127", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-127", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-128", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-325", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 228.5, 393.0, 63.0, 393.0, 63.0, 501.0, 37.5, 501.0 ],
					"source" : [ "obj-129", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-129", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-130", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-325", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 204.5, 393.0, 63.0, 393.0, 63.0, 501.0, 37.5, 501.0 ],
					"source" : [ "obj-131", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-131", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-132", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-325", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 412.5, 1014.0, 138.0, 1014.0, 138.0, 492.0, 37.5, 492.0 ],
					"source" : [ "obj-133", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-133", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-134", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-325", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 388.5, 1014.0, 138.0, 1014.0, 138.0, 492.0, 37.5, 492.0 ],
					"source" : [ "obj-135", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-135", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-136", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-325", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 364.5, 966.0, 321.0, 966.0, 321.0, 951.0, 297.0, 951.0, 297.0, 885.0, 138.0, 885.0, 138.0, 492.0, 37.5, 492.0 ],
					"source" : [ "obj-137", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-137", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-138", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-325", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 340.5, 948.0, 297.0, 948.0, 297.0, 885.0, 138.0, 885.0, 138.0, 492.0, 37.5, 492.0 ],
					"source" : [ "obj-139", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-139", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-140", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-325", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 276.5, 1002.0, 138.0, 1002.0, 138.0, 492.0, 37.5, 492.0 ],
					"source" : [ "obj-141", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-141", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-142", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-325", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 252.5, 984.0, 138.0, 984.0, 138.0, 492.0, 37.5, 492.0 ],
					"source" : [ "obj-143", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-143", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-144", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-325", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 228.5, 966.0, 138.0, 966.0, 138.0, 492.0, 37.5, 492.0 ],
					"source" : [ "obj-145", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-145", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-146", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-325", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 204.5, 948.0, 138.0, 948.0, 138.0, 492.0, 37.5, 492.0 ],
					"source" : [ "obj-147", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-147", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-148", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-325", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 412.5, 879.0, 345.0, 879.0, 345.0, 846.0, 321.0, 846.0, 321.0, 828.0, 297.0, 828.0, 297.0, 762.0, 138.0, 762.0, 138.0, 492.0, 37.5, 492.0 ],
					"source" : [ "obj-149", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-149", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-150", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-325", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 388.5, 861.0, 345.0, 861.0, 345.0, 846.0, 321.0, 846.0, 321.0, 828.0, 297.0, 828.0, 297.0, 762.0, 138.0, 762.0, 138.0, 492.0, 37.5, 492.0 ],
					"source" : [ "obj-151", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-151", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-152", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-325", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 364.5, 843.0, 321.0, 843.0, 321.0, 828.0, 297.0, 828.0, 297.0, 762.0, 138.0, 762.0, 138.0, 492.0, 37.5, 492.0 ],
					"source" : [ "obj-153", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-153", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-154", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-325", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 340.5, 825.0, 297.0, 825.0, 297.0, 762.0, 138.0, 762.0, 138.0, 492.0, 37.5, 492.0 ],
					"source" : [ "obj-155", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-155", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-156", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-325", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 276.5, 879.0, 138.0, 879.0, 138.0, 492.0, 37.5, 492.0 ],
					"source" : [ "obj-157", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-157", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-158", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-325", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 252.5, 861.0, 138.0, 861.0, 138.0, 492.0, 37.5, 492.0 ],
					"source" : [ "obj-159", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-159", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-160", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-325", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 228.5, 843.0, 138.0, 843.0, 138.0, 492.0, 37.5, 492.0 ],
					"source" : [ "obj-161", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-161", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-162", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-325", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 204.5, 825.0, 138.0, 825.0, 138.0, 492.0, 37.5, 492.0 ],
					"source" : [ "obj-163", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-163", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-164", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-325", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 412.5, 756.0, 345.0, 756.0, 345.0, 723.0, 321.0, 723.0, 321.0, 705.0, 297.0, 705.0, 297.0, 636.0, 138.0, 636.0, 138.0, 492.0, 37.5, 492.0 ],
					"source" : [ "obj-165", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-165", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-166", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-325", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 388.5, 738.0, 345.0, 738.0, 345.0, 723.0, 321.0, 723.0, 321.0, 705.0, 297.0, 705.0, 297.0, 636.0, 138.0, 636.0, 138.0, 492.0, 37.5, 492.0 ],
					"source" : [ "obj-167", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-167", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-168", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-325", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 364.5, 720.0, 321.0, 720.0, 321.0, 705.0, 297.0, 705.0, 297.0, 636.0, 138.0, 636.0, 138.0, 492.0, 37.5, 492.0 ],
					"source" : [ "obj-169", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-169", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-170", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-325", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 340.5, 702.0, 297.0, 702.0, 297.0, 636.0, 138.0, 636.0, 138.0, 492.0, 37.5, 492.0 ],
					"source" : [ "obj-171", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-171", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-172", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-325", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 276.5, 756.0, 138.0, 756.0, 138.0, 492.0, 37.5, 492.0 ],
					"source" : [ "obj-173", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-173", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-174", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-325", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 252.5, 738.0, 138.0, 738.0, 138.0, 492.0, 37.5, 492.0 ],
					"source" : [ "obj-175", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-175", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-176", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-325", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 228.5, 720.0, 138.0, 720.0, 138.0, 492.0, 37.5, 492.0 ],
					"source" : [ "obj-177", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-177", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-178", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-325", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 204.5, 702.0, 138.0, 702.0, 138.0, 492.0, 37.5, 492.0 ],
					"source" : [ "obj-179", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-179", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-180", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-325", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 412.5, 636.0, 345.0, 636.0, 345.0, 603.0, 321.0, 603.0, 321.0, 585.0, 297.0, 585.0, 297.0, 516.0, 138.0, 516.0, 138.0, 492.0, 37.5, 492.0 ],
					"source" : [ "obj-181", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-181", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-182", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-325", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 388.5, 618.0, 345.0, 618.0, 345.0, 603.0, 321.0, 603.0, 321.0, 585.0, 297.0, 585.0, 297.0, 516.0, 138.0, 516.0, 138.0, 492.0, 37.5, 492.0 ],
					"source" : [ "obj-183", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-183", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-184", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-325", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 364.5, 600.0, 321.0, 600.0, 321.0, 585.0, 297.0, 585.0, 297.0, 516.0, 138.0, 516.0, 138.0, 492.0, 37.5, 492.0 ],
					"source" : [ "obj-185", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-185", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-186", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-325", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 340.5, 582.0, 297.0, 582.0, 297.0, 516.0, 138.0, 516.0, 138.0, 492.0, 37.5, 492.0 ],
					"source" : [ "obj-187", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-187", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-188", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-325", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 276.5, 636.0, 138.0, 636.0, 138.0, 492.0, 37.5, 492.0 ],
					"source" : [ "obj-189", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-189", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-190", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-325", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 252.5, 618.0, 138.0, 618.0, 138.0, 492.0, 37.5, 492.0 ],
					"source" : [ "obj-191", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-191", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-192", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-325", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 228.5, 600.0, 138.0, 600.0, 138.0, 492.0, 37.5, 492.0 ],
					"source" : [ "obj-193", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-193", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-194", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-325", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 204.5, 582.0, 138.0, 582.0, 138.0, 492.0, 37.5, 492.0 ],
					"source" : [ "obj-195", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-195", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-196", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-69", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-2", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-262", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-25", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-325", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-259", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-25", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-261", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-326", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-261", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-260", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-325", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-262", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-326", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-325", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 204.5, 138.0, 63.0, 138.0, 63.0, 501.0, 37.5, 501.0 ],
					"source" : [ "obj-69", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-325", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 228.5, 138.0, 63.0, 138.0, 63.0, 501.0, 37.5, 501.0 ],
					"source" : [ "obj-71", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-71", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-72", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-325", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 276.5, 135.0, 63.0, 135.0, 63.0, 501.0, 37.5, 501.0 ],
					"source" : [ "obj-73", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-73", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-74", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-325", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 252.5, 138.0, 63.0, 138.0, 63.0, 501.0, 37.5, 501.0 ],
					"source" : [ "obj-75", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-75", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-76", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-325", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 412.5, 135.0, 63.0, 135.0, 63.0, 501.0, 37.5, 501.0 ],
					"source" : [ "obj-77", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-77", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-78", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-325", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 388.5, 138.0, 63.0, 138.0, 63.0, 501.0, 37.5, 501.0 ],
					"source" : [ "obj-79", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-79", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-80", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-325", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 364.5, 138.0, 63.0, 138.0, 63.0, 501.0, 37.5, 501.0 ],
					"source" : [ "obj-81", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-81", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-82", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-325", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 340.5, 135.0, 63.0, 135.0, 63.0, 501.0, 37.5, 501.0 ],
					"source" : [ "obj-83", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-83", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-84", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-325", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 412.5, 267.0, 63.0, 267.0, 63.0, 501.0, 37.5, 501.0 ],
					"source" : [ "obj-85", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-85", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-86", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-325", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 388.5, 267.0, 63.0, 267.0, 63.0, 501.0, 37.5, 501.0 ],
					"source" : [ "obj-87", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-87", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-88", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-325", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 364.5, 267.0, 63.0, 267.0, 63.0, 501.0, 37.5, 501.0 ],
					"source" : [ "obj-89", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-89", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-90", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-325", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 340.5, 267.0, 63.0, 267.0, 63.0, 501.0, 37.5, 501.0 ],
					"source" : [ "obj-91", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-91", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-92", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-325", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 276.5, 267.0, 63.0, 267.0, 63.0, 501.0, 37.5, 501.0 ],
					"source" : [ "obj-93", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-93", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-94", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-325", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 252.5, 267.0, 63.0, 267.0, 63.0, 501.0, 37.5, 501.0 ],
					"source" : [ "obj-95", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-95", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-96", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-325", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 228.5, 267.0, 63.0, 267.0, 63.0, 501.0, 37.5, 501.0 ],
					"source" : [ "obj-97", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-97", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-98", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-325", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 204.5, 267.0, 63.0, 267.0, 63.0, 501.0, 37.5, 501.0 ],
					"source" : [ "obj-99", 0 ]
				}

			}
 ],
		"dependency_cache" : [ 			{
				"name" : "pk.push_ui.js",
				"bootpath" : "/Users/patrick/Music/Ableton/User Library/M4L/PK Push Looper",
				"patcherrelativepath" : ".",
				"type" : "TEXT",
				"implicit" : 1
			}
 ]
	}

}

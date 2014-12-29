# About PlaneShift.SkinTools

PAWS (a short for "PlaneShift Advanced Window Specification") is XML-based language used to define UI parts and also custom skins for PlaneShift 3D Fantasy MMORPG. 

*PlaneShift.SkinTools* project provides XSL transformation from PAWS to HTML to speedup skin development by allow previewing UI structure in the browser 
before testing it in the game client.

![Screenshot](https://raw.githubusercontent.com/roman-yagodin/PlaneShift.SkinTools/master/images/screen_inventory.png "Standard inventory window structure")

## Installation

Click *Download ZIP* button and unpack, or `git clone https://github.com/roman-yagodin/PlaneShift.SkinTools.git`

## Use

You could test *PlaneShift.SkinTools* by using files from PlaneShift install (`/planeshift/art/skins` (unzip them first), `/planeshift/data/ui`).

### Browser

Add `xml-stylesheet` reference to the beginning of PAWS file (as shown below), then open PAWS file in the browser:

```XML
<?xml version="1.0" encoding="utf-8"?>
<?xml-stylesheet type="text/xsl" href="xslt/paws-default.xslt"?>

```

Currently tested in the Firefox, should also work in the Iceweasel and (hopefully) in the IE. 
Chrome (Chromium) should be started with `--allow-file-access-from-files` flag to make it work.

After that you could:

1. Make changes in the PAWS file, then just refresh browser tab to see results.
2. Use internal browser development tools to tweak values of inline CSS styles and then move them to the PAWS file.
3. Make a nicer skin, after all.

### Transform Script

Use provided `paws2html` Bash script to make HTML file from PAWS one:

```Shell
./paws2html buddy.xml

```

This one will generate `buddy.xml.html` file, which can be opened in any browser (`xml-stylesheet` reference don't needed). 

Note that `paws2html` uses `xsltproc` to do XSL transform, so it should be installed in your system:

```Shell
apt install xsltproc # Debian
sudo apt-get install xsltproc # Ubuntu
... # pull request please for other systems!
```

## Development

* Create XSD or RELAX-NG shema definition using available PAWS files as a base.
* Use created shema to validate PAWS files before packaging.
* Automate skin packaging, excluding certain files / folder. 
* Visualize `imagelist.xml`.
* Provide interactive moving / resizing of widget blocks.

## Links

* [PlaneShift Official Website](http://www.planeshift.it)
* [PlaneShift Mods Forum](http://www.hydlaaplaza.com/smf/index.php?board=61.0)
* [PAWS Specification](http://planeshift.top-ix.org/pswiki/index.php?title=PAWS_specification) 


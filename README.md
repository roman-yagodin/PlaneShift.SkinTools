# About PlaneShift.SkinTools

PAWS (a short for "PlaneShift Advanced Window Specification") is XML-based language used to define UI parts and also custom skins for PlaneShift 3D Fantasy MMORPG. 

*PlaneShift.SkinTools* project currently provides:

* XSL transformation from PAWS to HTML to speedup skin development by allow previewing UI structure in the browser before testing it in the game client.
* Auto-generated XSD schema to validate PAWS files.

![Screenshot](https://raw.githubusercontent.com/roman-yagodin/PlaneShift.SkinTools/master/images/screen_inventory.png "Standard inventory window structure")

## Installation

Click *Download ZIP* button and unpack, or `git clone https://github.com/roman-yagodin/PlaneShift.SkinTools.git`

## Preview

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

## Validation

Folder `schemas` contain XSD v1.0 and v1.1 auto-generated schemas, made with *Trang* tool on `/planeshift/data/gui` contents from released client. 

To validate a file, use provided `paws-validate` script:

```Shell
./paws-validate mypart.xml
```

By default, script perform validation against XSD v1.0 schema.

## Required software

Note that `paws2html` script uses `xsltproc` tool to do XSL transform, and `paws-validate` script uses `xmllint` tool to do schema validation. 
Both tools are using `libxml2` library features.

```Shell
apt install libxml2-utils xsltproc # Debian
sudo apt-get install libxml2-utils xsltproc # Ubuntu
... # pull request please for other systems!
```

## Development

* Create XSD or (and) RELAX-NG schema definition using available PAWS files as a base.
* Use created schema to validate PAWS files before packaging.
* Automate skin packaging, excluding certain files / folder. 
* Visualize `imagelist.xml`.
* Provide interactive moving / resizing of widget blocks.

## Links

* [PlaneShift Official Website](http://www.planeshift.it)
* [PlaneShift Mods Forum](http://www.hydlaaplaza.com/smf/index.php?board=61.0)
* [PAWS Specification](http://planeshift.top-ix.org/pswiki/index.php?title=PAWS_specification) 

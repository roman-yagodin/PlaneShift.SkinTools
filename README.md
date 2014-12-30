# About PlaneShift.SkinTools

PAWS (a short for "PlaneShift Advanced Window Specification") is XML-based language used to define UI parts and also custom skins for PlaneShift 3D Fantasy MMORPG. 

*PlaneShift.SkinTools* project currently provides:

* XSL transformation from PAWS to HTML to speedup skin development by allow previewing UI structure in the browser before testing it in the game client.
* XSL transformation from PAWS to HTML to visualize `imagelist.xml` resources.
* Auto-generated XSD schemas to validate PAWS files.

## Installation

Click *Download ZIP* button and unpack, or `git clone https://github.com/roman-yagodin/PlaneShift.SkinTools.git`

Merge extracted files and folders with skin content, so scripts like `paws2html` should be placed in the root skin folder.

## Preview

You could test *PlaneShift.SkinTools* by using files from PlaneShift install (`/planeshift/art/skins` (unzip them first), `/planeshift/data/ui`).

### Browser

Add `xml-stylesheet` reference entry to the beginning of PAWS file (as shown below), then open PAWS file in the browser:

```XML
<?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet type="text/xsl" href="xslt/paws-default.xslt"?>

```

![Screenshot](https://raw.githubusercontent.com/roman-yagodin/PlaneShift.SkinTools/master/images/screen_inventory.png "Standard inventory window structure")

For `imagelist.xml` preview:

```XML
<?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet type="text/xsl" href="xslt/paws-imagelist.xslt"?>

```

![Screenshot](https://raw.githubusercontent.com/roman-yagodin/PlaneShift.SkinTools/master/images/screen_imagelist.png "Preview of imagelist.xml resources")

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

This one will generate `buddy.xml.html` file with `paws-default.xslt` transform. Generated HTML file can be opened in any browser (no `xml-stylesheet` entry is needed).

## Validation

Folder `schema` contain XSD v1.0 and v1.1 auto-generated schemas, made with *Trang* tool on `/planeshift/data/gui` contents from released client. 

To validate a file, use provided `paws-validate` script:

```Shell
./paws-validate readbook.xml
```

By default, script perform validation against XSD v1.0 schema.

## Required software

Note that provided scripts use `xsltproc` tool to do XSL transform and `xmllint` tool to do schema validation. Both tools are based on `libxml2` library. To install them, use your package manager:

```Shell
apt install libxml2-utils xsltproc # Debian
sudo apt-get install libxml2-utils xsltproc # Ubuntu
... # pull request please for other systems!
```

## To-Do's

- [x] Create XSD schema definition using available PAWS files as a base.
- [x] Use created schema to validate PAWS files before packaging.
- [ ] Automate skin packaging, excluding certain files / folder.
- [ ] Review folder structure to avoid conflicts with skin content.
- [x] Visualize `imagelist.xml`.
- [ ] Visualize `styles.xml`.
- [ ] Merge various XSL transformations into single one.
- [ ] Provide interactive moving / resizing of widget blocks.

## Links

* [PlaneShift Official Website](http://www.planeshift.it)
* [PlaneShift Mods Forum](http://www.hydlaaplaza.com/smf/index.php?board=61.0)
* [PAWS Specification](http://planeshift.top-ix.org/pswiki/index.php?title=PAWS_specification) 


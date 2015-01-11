# About PlaneShift.SkinTools (PST)

PAWS (a short for "PlaneShift Advanced Window Specification") is XML-based language used to define UI parts and also custom skins for *PlaneShift 3D Fantasy MMORPG*. 

*PlaneShift.SkinTools* allows skin developer to:

* Speedup skin development by allow previewing UI structure and `imagelist.xml` resources in the browser (before testing it in the game client) using provided XSL transformations from PAWS to HTML.
* Reduce coding errors by providing validation of PAWS files against auto-generated XSD schemas.
* Build skin package and deploy it to the specified locations with few clicks.

## Installation

1. Download latest [PST release package](https://github.com/roman-yagodin/PlaneShift.SkinTools/releases).
2. Unpack it and copy `pst` folder and all `pst-*` scripts to the root skin folder. From now on you already can use browser previews.
3. Using scripts require additional configuration and it is Linux-specific. Rename `pst-params.template` to `pst-params` and set your values for `PACKAGE_NAME` and `DEPLOY_PATHS` variables.

## Browser Previews

You could test browser previews by using files from *PlaneShift* install (`/planeshift/art/skins` directory (unzip them first), `/planeshift/data/ui` directory).

Add `xml-stylesheet` reference entry to the beginning of PAWS file (as shown below), then open this file in the browser:

```XML
<?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet type="text/xsl" href="pst/xslt/default.xslt"?>
```

Inventory window structure:

![Screenshot](https://raw.githubusercontent.com/roman-yagodin/PlaneShift.SkinTools/master/images/screen_inventory.png "Inventory window structure")

Preview of `imagelist.xml` resources:

![Screenshot](https://raw.githubusercontent.com/roman-yagodin/PlaneShift.SkinTools/master/images/screen_imagelist.png "Preview of imagelist.xml resources")

Currently tested in the *Firefox*, should also work in the *Iceweasel* and (hopefully) in the *IE*. 
*Chrome* (*Chromium*) should be started with `--allow-file-access-from-files` flag to make it work.

After that you could:

1. Make changes in the PAWS file, then just refresh browser tab to see results.
2. Use internal browser development tools to tweak values of inline CSS styles and then move them to the PAWS file.
3. Make a nicer skin, after all.

    Note that `xml-stylesheet` reference entries are ignored by PS client application, 
    so it's safe to leave them in the released skin packages - though this can change in the future PS releases. 

## Transform Script

Use provided `pst-transform` script to make HTML file from PAWS one:

```Shell
./pst-transform buddy.xml

```

This one will generate `buddy.xml.html` file with `default.xslt` transform. Generated HTML file can be opened in any browser (no `xml-stylesheet` entry is needed).

## Validation

To validate PAWS files, use provided `pst-validate` script:

```Shell
# validate single file:
./pst-validate readbook.xml

# validate several files at once:
./pst-validate readbook.xml infowindow.xml

# validate all skin PAWS files (underscore-prefixed filenames like "_myfile.xml" will be ignored):
./pst-validate
```

By default, script perform validation against XSD v1.0 schema, as defined by `SCHEMA` variable in the `pst-params`. 
Folder `pst/schema` contain XSD v1.0 and v1.1 auto-generated schemas, made with *trang* tool on `/planeshift/data/gui` contents from released client.

## Build Skin

To build skin package, use `pst-build` script. It also performs validation of skin files, but will create skin package anyway.

Change `PACKAGE_NAME` variable value in `pst-params` to set the right package name. Script excludes folders `pst`, `src` and underscore-prefixed filenames.

## Deploy Skin

To test skin changes in the PS client, skin package should be copied to the `/planeshift/art/skins` folder -
but in case there are several PS client installs, it's good to automate the process by using `pst-build-deploy` script. 

Script `pst-build-deploy` calls `pst-build` script to perform validation and package creation, then copies skin package to the all paths, specified in the `DEPLOY_PATHS` variable in `pst-params`.

## Required Software

Provided scripts use *xsltproc* tool to do XSL transform and *xmllint* tool to do schema validation (both are based on *libxml2* library). Also, *zip* utility is used to build skin packages. To install required software, use your package manager:

```Shell
apt install libxml2-utils xsltproc zip # Debian
sudo apt-get install libxml2-utils xsltproc zip # Ubuntu
... # pull request please for other systems!
```

## To-Do's

- [x] Create XSD schema definition using available PAWS files as a base.
- [x] Use created schema to validate PAWS files before packaging.
- [x] Automate skin packaging, excluding certain files / folder.
- [x] Review folder structure to avoid conflicts with skin content.
- [x] Visualize `imagelist.xml`.
- [ ] Visualize `styles.xml`.
- [x] Merge various XSL transformations into single one.
- [ ] Provide interactive moving / resizing of widget blocks.

## Links

* [PlaneShift Official Website](http://www.planeshift.it)
* [PlaneShift Mods Forum](http://www.hydlaaplaza.com/smf/index.php?board=61.0)
* [PAWS Specification](http://planeshift.top-ix.org/pswiki/index.php?title=PAWS_specification) 

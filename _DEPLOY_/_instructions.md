## RUN DEPLOYMENT

1. Navigate to the **_DEPLOY_** directory of **uikit** repository.    
```bash
cd /Users/tony/Projects/_repos_/uikit/_DEPLOY_
```

2. Execute the **deploy_uikit** script.
```bash
./deploy_uikit.sh path-to-the-project-roots-app-directory
```

3. Add fonts, update the respective files in **ui/site/less/** directory
4. Compile the **uikit.site.less** (in ui/site/less)


## RUN UPDATE

1. Navigate to the **_DEPLOY_** directory of **uikit** repository.    
```bash
cd /Users/tony/Projects/_repos_/uikit/_DEPLOY_
```

2. Execute the **update_uikit** script.
```bash
./update_uikit.sh ath-to-the-project-roots-app-directory
```

3. Re-compile the **uikit.site.less** (in ui/site/less) 




## DJANGO Integration

1. in **settings**, point new dev static directory to " BASE / "ui/dist"






---

### SCRIPT EXECUTABLE PERMISSIONS

chmod +x update_uikit.sh
chmod +x deploy_uikit.sh


### EXCLUDE THE _DEPLOY_ FOLDER SILENTLY FROM GIT

To view hidden files, including the `.git` directory, in your terminal, you can use the `ls -a` command, which lists all files, including hidden ones. Here's how you can use it:

```bash
ls -a
```

This command will show all files and directories, including those starting with a dot, such as `.git`. You can also use `ls -al` to view detailed information about the files, including permissions, ownership, size, and modification date in a list format.

If you find the `.git` folder, you can proceed with using the `.git/info/exclude` file to locally ignore files as previously discussed. Just navigate into the `.git` directory, and then into the `info` directory to add or modify the `exclude` file:

```bash
cd .git/info
nano exclude
```

You can add the paths of the directories or files you want to ignore in this `exclude` file, similar to how you would add them to a `.gitignore` file. This method ensures that the ignores are specific to your local repository setup and won't affect other users or the repository itself when pushed.



### PROCESS DEPLOY

*the process shell script will be run from the subfolder **_DEPLOY_** of the **uikit** repository*

1. Input 1: location of the **target project's root** directory
2. Create **ui** folder in the project's root directory
3. Copy to the **ui** folders from uikit repository:
   - dist
   - src
   - tests
4. Inside the **ui/dist/css** folder create empty file **specific.css**
5. In the **ui/dist** directory create folder **brand**
6. Inside the **brand** folder, create additional folders:
    - fonts (location of the brand fonts)
    - elements (brand logos and other elements)
    - icons (various brand icons, including favicon)
    - social (brand images and elements for site sharing, fb, og, meta)
    - *+ other folders as needed for brand related material like fill-chips, textures, etc*
7. Copy to the **ui/tests/js** directory the file from **uikit** repository from **_DEPLOY_/tests/js/test.js**
8. Under the **ui** directory, create new folder **site**
9.  Create alias of **ui/src/images** for the **ui/site/images**
10. Create folder **less** inside **ui/site**
11. Copy the **ui/src/less/theme** folder into **ui/site/less/orig-theme**
12. Copy the **ui/src/less/components** folder into **ui/site/less/orig-core**
13. from **uikit** repository from **_DEPLOY_/less** directory copy folder **site** and file **uikit.site.less** into the **ui/site/less** directory



### PROCESS UPDATE

*the process shell script will be run from the subfolder **_DEPLOY_** of the **uikit** repository*

1. Input 1: location of the **target project's root** directory
2. To the **ui** folder in the **target project's root** directory copy&replace folders from **uikit** repository:
   - src
   - tests
3. To the **ui/dist/css** folder copy all files from **dist/css** directory of the **uikit** repository (if some of the files already exists in the **ui/dist/css** folder, overwrite them, but leave other files in the **ui/dist/css** directory untouched)
4. To the **ui/dist/js** folder copy all files from **dist/js** directory of the **uikit** repository (if some of the files already exists in the **ui/dist/js** folder, overwrite them,  but leave other files in the **ui/dist/js** directory untouched)
5. Copy to the **ui/tests/js** directory the file from **uikit** repository from **_DEPLOY_/tests/js/test.js**
6. Re-create&replace alias of **ui/src/images** in the **ui/site/images**
7. Copy&replace the **ui/src/less/theme** folder into **ui/site/less/orig-theme**
8. Copy&replace the **ui/src/less/components** folder into **ui/site/less/orig-core**








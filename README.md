# Drude Drupal 8 Testing

This is a sample vanila Drupal 8 installation preconfigured for use with Drude.  

## Instructions (Mac, Windows, Linux)

**On Windows** you will need a Linux-type shell. Install [Babun](http://babun.github.io/) before proceeding and run all commands in it.  
Instructions were not tested with other shells on Windows.

1. Install `dsh` (Drude Shell)

    ```
    sudo curl -L https://raw.githubusercontent.com/blinkreaction/drude/master/bin/dsh  -o /usr/local/bin/dsh
    sudo chmod +x /usr/local/bin/dsh
    ```

2. Create the `<Projects>` directory
    
    E.g. `~/Projects` on Mac and Linux, `c:\Projects` on Windows
    
    ```
    mkdir Projects
    cd Projects
    ```

3. Install Drude's prerequisites
    
    Mac and Windows: virtualbox, vagrant, boot2docker-vagrant
    Linux: docker, docker-compose

    ```
    dsh install prerequisites
    dsh install boot2docker
    ```
    
4. Clone this repo into the Projects directory

    ```
    git clone https://github.com/blinkreaction/drude-d8-testing.git
    cd drude-d8-testing
    ```

5. Initialize the site

    This will initialize local settigns and install the site via drush

    ```
    dsh init
    ```

6. Add `192.168.10.10  drupal8.drude` to your hosts file

7. Point your browser to

    ```
    http://drupal8.drude
    ```


## Automation with 'dsh init'

Site provisioning can be automated using `dsh init`, which calls the shell script in [.drude/scripts/drude-init.sh](.drude/scripts/drude-init.sh).  
This script is meant to be modified per project. The one in this repo will give you a good starting point.

Some common tasks that can be handled by the init script:

- initialize local settings files (Docker Compose, Drupal, Behat, etc.)
- import DB / perform a site install
- compile Sass
- run DB updates, revert features, clear cached, etc.
- apply local settings (e.g. enable/disable modules, updates variable values)
- run Behat tests available in the repo

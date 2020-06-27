# dataops-dev-quickstart

From zero to up-and-running in no time flat!

## Q. Why create a developer quickstart for data projects?

*A.* There are two very big hurdles to data science people to benefit from modern software best practices: (1) dev machine setup and (2) training. After writing several wiki pages on the topic of "how to configure WSL and Docker on Windows" and after writing 2 Stackoverflow answers on this same topic, I finally realized: _it shouldn't be this hard!_

Enter the `dataops-quickstart` project! Driven by the question: Can we give a one-stop shop to setup a new repo and also at the same time to properly configure the user's dev machine? _It's an ambitious goal!_

--------

What follows is a WSL/Docker/Dev onboarding guide, with all of the now-automated steps are ~~crossed out~~. Let's see how much of the manual process we can automate! (Please do submit a [Pull Request](docs/CONTRIBUTING.md) if you think you can make this a _more-perfect_ automation.)

--------

## Step 0. Run the `dev_setup` script!

_**Description:** Run a script to take care of everything (or at least a much as possible as of this writing!)_
_**Estimated time:** 10-20 minutes_
_**Instructions:**_
1. Either [clone this repo](x-github-client://openRepo/https://github.com/aaronsteers/dataops-quickstart) or [download the script](https://raw.githubusercontent.com/aaronsteers/dataops-quickstart/feat/mvp/setup//win/dev_setup.bat).
2. From an admin prompt, run the `dev_setup.bat` script.
    * After running the script, restart your machine. You may need to run the script a second time if any installs failed the first time through.
3. Keep reading below and do anything that's not yet ~~crossed out~~.
4. If you've found a way to impove the automation, [submit a Pull Request](docs/CONTRIBUTING)!

--------

## Step 1: Clone our Repo

_**Description:** Git is needed in order to clone our code repositories and commit new code._

_**Estimated time:** 25-45 minutes_

_**Instructions (Windows):** _

3. (Optional:) Open GitHub settings and change your default repository settings to something like `C:\Files\Source\`
4. Open GitHub Desktop, select File → Clone Repository → URL → `https://github.com/aaronsteers/dataops-quickstart.git`
5. Open the new repo folder (e.g. "c:\Files\Source\propensity_to_buy\") in VS Code (or your favorite IDE) to confirm that the code is successfully downloaded.
6. If necessary, use the IDE or command line to switch branches. E.g

--------

## Step 2: Install Ubuntu (Optional)

_**Description:** Allows you to run Ubuntu natively on your Windows machine, courtesy of Windows Subsystem for Linux (WSL)._

_**Estimated time:** 5-10 minutes (may require system restart)_

**_Instructions:_`
1. Run `setup/wsl_setup.bat` from this repo.
    * On first run, you will need to pick a unix-compatible user name and password. _(Dot character not allowed in user name.)_
2. Open `Ubuntu` from the start menu to open a new Linux terminal window.
2. Run `lsb_release -a` to check your version number. _(Default "stable" as of this writing is 18.04.)_
3. Run ```python3 -V** to check the Python version number. _(Default as of this writing is 3.6.5.)_
    - _Take note!: Your entrypoints to run Python are "python3" and "pip3" (not "python" and "pip")_
12. Install few more things and you're done!
    1. `sudo apt-get install apt-transport-https`
    2. `sudo apt-get install ca-certificates`
    3. `sudo apt-get install curl`
    4. `sudo apt-get install software-properties-common`
    5. `sudo apt-get install python3-pip`
    6. `sudo apt-get install docker.io`
    7. `sudo apt-get install jq`

* *See also:*
- [https://nickjanetakis.com/blog/setting-up-docker-for-windows-and-wsl-to-work-flawlessly](https://nickjanetakis.com/blog/setting-up-docker-for-windows-and-wsl-to-work-flawlessly)

--------

## Step 3: Configure Docker for Windows

_**Description:** Allows you to execute linux containers on your machine and create your own containerized apps._

_**Estimated time:** 5-10 minutes._

_**Instructions:**_

0. ~~If you did not use the `dev_setup` script above, install **docker-ce** on your Windows or Mac at [http://www.DockerHub.com](http://www.DockerHub.com)~~
    * _(Restart may be required.)_
1. ~~Confirm docker is working (in Windows) by executing the following from command line: `docker run -it hello-world`~~
2. Open Docker Settings (on Windows: right-click the Docker icon in the lower-right taskbar).
3. Select the option to `Expose daemon on tcp://... without TLS.`
    - _(This allows Ubuntu's Docker client to talk to the Docker server running on Windows)_
4. From the "Shared Drives" tab, click to share your primary hard drive (e.g. "C" on Windows)

# Step 4: Configure Docker on WSL (Optional)
_**Description:** This step tells docker on your Ubuntu (WSL) system how to talk to the Docker server on Windows._

_**Estimated time:** 5-10 minutes._

_**Instructions:**_

1. Open Ubuntu
2. Execute `docker version` to confirm the docker version number _(As of this writing: `18.09.2**)_
    - If this fails, see WSL install instructions above, or run `sudo apt-get install docker.io`    3. Execute `docker run -it hello-world`
        - _(The first time you run this, it should fail with the message: `Cannot connect to the Docker daemon at...`)
4. Execute (only once): `echo "export DOCKER_HOST=[tcp://localhost:2375]()" >> ~/.bashrc`
    - Close and reopen bash or execute `source ~/.bashrc` to refresh your settings.
5. Map `/mnt/c/` to `/c/`.
    - This is needed so that paths expressed in Linux can still be "found" by the Docker server running in Windows. (You will want to run docker from inside `/c/` and not from `/mnt/c/`.)
    1. Edit `/etc/wsl.conf` to look like this:
        - ```
            [automount]
            root = /
            options = "metadata"
            ```
6. Execute: `docker run -it hello-world` _(this time it should work!)_
    - If hello-world runs, great! If not, that's okay! Double-check **step 5** and **step 7d** above.

**See also:**
- [https://nickjanetakis.com/blog/setting-up-docker-for-windows-and-wsl-to-work-flawlessly](https://nickjanetakis.com/blog/setting-up-docker-for-windows-and-wsl-to-work-flawlessly)
- [https://phoenixnap.com/kb/how-to-install-docker-on-ubuntu-18-04](https://phoenixnap.com/kb/how-to-install-docker-on-ubuntu-18-04)

--------

## Step 4: Install VS Code

_**Description:** Visual Studio Code ("VS Code") is a modern and lightweight IDE with a [rapidly growing user base](https://triplebyte.com/blog/editor-report-the-rise-of-visual-studio-code). VS Code has monthly product releases, and supports for virtually all mainstream languages and operating systems._

_**Estimated time:** 25-45 minutes_

**_Instructions:_**
1. ~~Download and install VS Code from [https://code.visualstudio.com/download](https://code.visualstudio.com/download)~~
2. Take a look at the Getting Started Guide if you are new: [https://code.visualstudio.com/docs](https://code.visualstudio.com/docs)
3. If you plan to use multiple machines, you will want to install and configure the **[Settings Sync](https://itnext.io/settings-sync-with-vs-code-c3d4f126989)** extension. _(Can takes 15-30 minutes.)_
4. Other helpful extensions (all are optional):
    - "Python"
    - "Docker"
    - _"change-case"_
    - "Terraform"
    - "YAML"
5. (Optional) Change the default terminal in VS Code to "wsl" or "bash": &lt;Ctrl+Shift+P&gt; → type "Switch Terminal" → &lt;Enter&gt;


# GitHub



## Getting started 

### Account sign-up {#github-signup}

To create an account on GitHub, begin by launching your web browser and navigate to <https://github.com/>.

<div class='click-img'><img src="img/signup_step_1.jpg" width="100%" style="display: block; margin: auto;" /></div>

In the signup form, enter your **your Mason `@gmu.edu` or `@masonlive.gmu.edu` email address**, a username, and a password, and then click on the "sign up for GitHub" button

<div class='click-img'><img src="img/signup_step_2.jpg" width="100%" style="display: block; margin: auto;" /></div>

After creating the account on GitHub, you will see a new page containing details about plans for repositories.
Keep the default options and click on the "Continue" button.

<div class='click-img'><img src="img/signup_step_3.jpg" width="100%" style="display: block; margin: auto;" /></div>

The next page asks you to provide information about your programming experience and other details.
This is optional.
To skip this step, click on the "skip this step" link.
Otherwise, once you are done entering the information, click the "Submit" button.

<div class='click-img'><img src="img/signup_step_4.jpg" width="100%" style="display: block; margin: auto;" /></div>

Your Github account is now created and you will be greeted with the welcome page.
You will also receive an email about account verification.
Please click on the link in the email to verify your account.

<div class='click-img'><img src="img/signup_step_5.jpg" width="100%" style="display: block; margin: auto;" /></div>


## Navigating the GitHub site

For your convenience, the course website contains links taking you directly to course content stored on GitHub.
However, you may prefer to access your existing content by navigating the GitHub site itself, so let's take a short tour of the GitHub interface.

### Main dashboard {#github-navigation-main-dashboard}

When you will login into GitHub for the first time you will see the main dashboard for the website.

<div class='click-img'><img src="img/dashboard_first_icons.jpg" width="100%" style="display: block; margin: auto;" /></div>

At the top of the dashboard there are several buttons, boxes, and icons that you can click in order to navigate the site.
Starting from the left,

*   **GitHub icon**: This is similar to the "Home" or "Main" buttons found on other websites.
    Clicking this icon brings you back to your currently active dashboard, which is what we're already viewing.

*   **Search bar**: Used to look for content on the GitHub site, such as repositories and user accounts, just click it and start typing.

*   **Pull requests**, **Issues**, **Marketplace**, and **Explore**: Of these links, the only one you might use for the course is "Pull requests", however we'll save the discussion about Pull requests for another time. 

*   **Bell icon**: This displays your account notifications, such as when someone tags your username.

*   **Plus icon**: Used for creating content, such as creating a new repository.

The last icon on the right is your profile picture, and clicking it opens up another menu containing some additional links.

<div class='click-img'><img src="img/navigating_step_3_2.jpg" width="100%" style="display: block; margin: auto;" /></div>

From this menu you can reach your profile, account settings, the help section, and a couple other of other pages.
Let's take a quick look to see what the profile and settings pages look like.

### Profile page

Clicking **Your profile** will take you to your account's profile page.

<div class='click-img'><img src="img/repository_step_8.jpg" width="100%" style="display: block; margin: auto;" /></div>

Since you most likely have a new account, there won't be much here right now.
If you click the **Repositories** tab at the top of your profile, it will display a list of repositories associated with your account, *however keep in mind that it will not have any content you work on for the class*.
This is because the repositories you create for the class assignments are created under the class organization rather than associated with you.
This is important to keep in mind when you are looking for your files - see below for how to find your class assignment repositories.

### Settings

Clicking **Settings** takes you to the account settings page where you can inspect and update your account settings.
Use the menu on the left to choose the setting you would like to change.

<div class='click-img'><img src="img/github_account_settings_menu.png" width="219px" style="display: block; margin: auto;" /></div>

For now you may want to upload a profile picture or add a short bio under the **Profile** setting.
You can also change how the site sends you email updates and notification alerts under the **Emails** and **Notifications** settings.

### Class organization page

Returning to the main dashboard, after you've complete a few of the assignments for the class, your dashboard will begin to look more like this.

<div class='click-img'><img src="img/dashboard_dropdown_menu.png" width="100%" style="display: block; margin: auto;" /></div>

As we learned while looking at the profile page, your classwork will not be visible there.
Instead, you will need to navigate to the class organization in order to find your files for the class, so let's do that now.

Your section's organization (for CDS 101) will be at a URL like this: 

* https://github.com/mason-sp20-cds101-001
* https://github.com/mason-sp20-cds101-002
* https://github.com/mason-sp20-cds101-dl1
* https://github.com/mason-sp20-cds101-dl2

In these examples, `sp20` stands for the Spring 2020 semester, and the last three digits are the number of your section.

When you navigate to your appropriate class organization page, you should see a page similar to this:

<div class='click-img'><img src="img/dashboard_course_organization.png" width="100%" style="display: block; margin: auto;" /></div>

The dashboard is similar to the dashboard we saw earlier, but it will only contain content associated with the class.
On the left you will see a list of some of your class repositories, which you can filter by typing in the *Find a repository...* search box.
If you don't see any repositories there, don't worry, we will get around to creating them soon enough!

To see a full list of your class repositories, similar to the repositories tab on your profile page, click the **View organization** button on the upper right of the page.

<div class='click-img'><img src="img/course_organization_repo_list.png" width="100%" style="display: block; margin: auto;" /></div>

Here you should be able to find all of the repositories that you've used during the class.

::::: {.alert .alert-warning}
<span class="h4">Keep in mind</span>

If you click the **GitHub icon** while you are accessing content in the class organization, *it will bring you back to the class organization dashboard, not the [main dashboard](#github-navigation-main-dashboard) we saw earlier*.
To get back to the main dashboard, click the gray icon with the class organization name and then click your username in the dropdown menu.
:::::

## Repositories

When you access a repository on GitHub, the page will look similar to the screenshot below,

<div class='click-img'><img src="img/demo_repo_tabs_and_buttons.png" width="100%" style="display: block; margin: auto;" /></div>

The page contains a lot of information about the repository along with multiple tabs and buttons, which can be a bit overwhelming at first.
As it turns out, we will not need to use many of these tabs or buttons during the class, so instead let's focus on the most important ones, which have been highlighted in the red and blue rectangles.

*   Red
    *   **Code tab:** Clicking this brings you back to the main repository page, which is what is displayed in the above screenshot
    *   **Commit tab:** takes you to the commit history for the repository, which are the series of "snapshots" that you create using the `git` tool in RStudio
*   Blue
    *   **Dropdown branch menu:** use this to inspect a branch that is different from the default **master** branch
    *   **Clone or download button:** provides a link to use when obtaining a copy of a repository. For the class, you will do this by creating a new project in RStudio using the *version control* option.
    *   **Pull requests tab:** generally used for code reviews and quality control when a user wants to contribute code to a repository. For the class, pull requests will be used to submit your work so that the instructor is able to leave line-by-line comments about your code.

Below the tabs and button is a list of files stored in the repository,

<div class='click-img'><img src="img/demo_repo_files_list.png" width="100%" style="display: block; margin: auto;" /></div>

Each repository will have different files.
Clicking a file's name will bring you to another page that shows a preview of the file contents.
The descriptions in the middle of the file list show the most recent commit message for each file and the timespan on the right shows how recently the file was last updated.

The above file list also shows you what you'll see in a folder after you first obtain a copy of the repository.
In that way, each repository can be thought of as a folder containing files,

<div class='click-img'><img src="img/repo_files_windows_folder.png" width="100%" style="display: block; margin: auto;" /></div>

The advantage of this approach is that each repository you create is isolated and separate, which helps to reduce certain kinds of coding errors.

Below the repository file list is a rendered version of the `README.md` file,

<div class='click-img'><img src="img/demo_repo_readme_box.png" width="100%" style="display: block; margin: auto;" /></div>

The `README.md` file describes the contents of the repository and can be used as a form of documentation.
It is a good idea to look at the `README.md` file of any repository you visit on GitHub to see if it gives examples or quick instructions on how to set up and use the files.

## Additional topics

### How to create a repository

We saw in the last tutorial that after creating an account on GitHub, there are three ways to create a repository. The most common method of creating a repository is to click on "+" sign and then click on "New repository" option.

<div class='click-img'><img src="img/repository_step_1.jpg" width="100%" style="display: block; margin: auto;" /></div>

After clicking on "New repository" you will go to a new screen where you need to give a repository name. You will also find two options to either keep repository as public or private. In the end, there will be another option to initialize the repository with Readme.md file.

<div class='click-img'><img src="img/repository_step_2.jpg" width="100%" style="display: block; margin: auto;" /></div>

GitHub doesn't allow to create a repository without a name. Thus, it is mandatory to give a name to the repository. After providing all the details and selecting appropriate options click on "Create repository" button.

<div class='click-img'><img src="img/repository_step_3.jpg" width="100%" style="display: block; margin: auto;" /></div>

In this way, the repository will be successfully created. If you have ticked on initializing the repository with Readme.md file, then you will find the file in the repository. You can easily edit Readme.md file by clicking on the file.

<div class='click-img'><img src="img/repository_step_4.jpg" width="100%" style="display: block; margin: auto;" /></div>

After clicking Readme.md file if you want to add any content in that file then click on the pencil symbol. Click on "Commit" button after making changes in the file.

<div class='click-img'><img src="img/repository_step_5.jpg" width="100%" style="display: block; margin: auto;" /></div>

### How to import a repository

To import a repository from another account click on the "+" sign and then click on "Import repository" option. After that, you need to provide a link of the other repository which you need to clone or import and the repository name to store it under on your GitHub account. After giving all the details click on "Begin import" button.

<div class='click-img'><img src="img/repository_step_6.jpg" width="100%" style="display: block; margin: auto;" /></div>

The import process will start, and you will get a notification after completion of the import process.

<div class='click-img'><img src="img/repository_step_7.jpg" width="100%" style="display: block; margin: auto;" /></div>

Finally, you will be able to see the imported repository in your GitHub account.

<div class='click-img'><img src="img/repository_step_8.jpg" width="100%" style="display: block; margin: auto;" /></div>

# jenkins-webshowcase-sh

# Jenkins Static Website Automation :

Automate the creation and deployment of a **multi-page static website** using **Jenkins** and a **Bash shell script**.  
This project demonstrates Jenkins' ability to handle not only CI/CD pipelines but also infrastructure and web automation tasks efficiently.

---

## Overview :

| Attribute | Details |
|------------|----------|
| **Project Name** | Jenkins Static Website Automation |
| **Created By** | Jenkins Pipeline Shell Script |
| **Deployment Path** | `/var/www/html/jenkins.html` |
| **Technologies Used** | HTML, CSS, Bash, Jenkins |
| **Total Pages** | 3 (Home, Installation, Features) |
| **Automation Goal** | Demonstrate Jenkins for static site setup |

---

##  Project Structure :

After successful execution, the project directory will look like this:

/var/www/html/jenkins.html

│

├── index.html # Homepage - Introduction to Jenkins

├── installation.html # Installation guide

└── features.html # Key features and benefits


---

##  Script Functionality :

The shell script automatically performs the following:

1. Creates a directory `/var/www/html/jenkins.html`
2. Sets proper file permissions
3. Generates three HTML pages dynamically
4. Deploys them as a complete static website

---

## How to Run via Jenkins: 

#### Step 1: Create a New Jenkins Job

    - Open Jenkins → New Item → Select Freestyle Project

    - Name it jenkins-static-website

![](./img/Screenshot%202025-10-15%20111124.png)
fig: creted new job.

####  Step 2: Add the Shell Script

    - Go to Build → Add build step → Execute shell

    - Paste the above script


#### Step 3: Apply and Build

    - Save the configuration

    - Click Build Now to execute the script
    
![](./img/Screenshot%202025-10-15%20111252.png)
fig: job creted and successful

![](./img/Screenshot%202025-10-15%20111304.png)
fig: consol output


#### Step 4: Verify the Website

Once the build is complete, open your browser and navigate to:

-  http://localhost/jenkins.html/

You should see your Jenkins static website with all three pages.
![](./img/Screenshot%202025-10-15%20113200.png)
fig: frist home page

![](./img/Screenshot%202025-10-15%20113218.png)
fig: second installtion page

![](./img/Screenshot%202025-10-15%20113237.png)
fig: third key features page


###  Learning Objectives

- This project helps you understand:

    - How Jenkins can automate non-code tasks like static site creation

    - How to integrate Bash scripting into a Jenkins pipeline

    - How to host static content on a Linux web server automatically

### Key Takeaways
- Automate repetitive web setup tasks
- Learn CI/CD automation concepts
- Practice shell scripting with Jenkins
- Showcase DevOps skills for your portfolio

### Author

Nikita Thosare
 IT Engineer | Cloud & DevOps Enthusiast | Automation Learner
 
🔗 https://www.linkedin.com/in/nikita-thosare-b9b8072a5/

📰 https://medium.com/@thosarenikita

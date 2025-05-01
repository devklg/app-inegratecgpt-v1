# Deployment Instructions for Hostinger

## 1. Build the Project
npm run build


## 2. Preparing Files for Hostinger
- The build process will create a `dist` folder with all necessary files
- Compress the contents of the `dist` folder into a ZIP file if easier to upload

## 3. Upload to Hostinger
- Log in to your Hostinger account
- Navigate to File Manager or use FTP
- Upload the contents of the `dist` folder to your public_html directory (or a subdirectory if preferred)

## 4. Configure for React Router
- Create or edit an .htaccess file in your root directory
- Add the following rules:

RewriteEngine On RewriteBase / RewriteRule ^index\.html$ - [L] RewriteCond %{REQUEST_FILENAME} !-f RewriteCond %{REQUEST_FILENAME} !-d RewriteRule . /index.html [L] ```
5. Verify Deployment
Visit your domain to ensure the site is working correctly
Test navigation between pages
Verify that forms and interactive elements are functioning
6. Final Steps
Set up any required DNS records if using a custom domain
Configure SSL certificate through Hostinger
Test the site on multiple devices and browsers EOF
Install dependencies
echo -e "
AND
AND
L
L
THE
IN
I
n
s
t
a
l
l
i
n
g
d
and
p
and
n
d
and
n
c
i
and
s
.
.
.
YELLOWInstallingdependencies...{NC}" npm install

Final steps and instructions
echo -e "\n
G
R
AND
AND
N
P
r
the
GREENProjectstructureforKevin 
′
 sKongaLinecreatedsuccessfully!{NC}" echo -e "\n
B
L
IN
AND
N
and
x
t
s
t
and
p
s
:
BLUENextsteps:{NC}" echo -e "1. Run
AND
AND
L
L
THE
IN
n
p
m
r
in
n
d
and
in
YELLOWnpmrundev{NC} to start the development server" echo -e "2. Edit the components in the src directory as needed" echo -e "3. When ready for production, run
AND
AND
L
L
THE
IN
n
p
m
r
in
n
b
in
i
l
d
YELLOWnpmrunbuild{NC}" echo -e "4. Upload the files from the dist folder to your Hostinger hosting" echo -e "\n
B
L
IN
AND
F
the
r
d
and
p
l
the
and
m
and
n
t
i
n
s
t
r
in
c
t
i
the
n
s
,
s
and
and
:
BLUEFordeploymentinstructions,see:{NC} ./HOSTINGER_DEPLOYMENT.md" echo -e "\n
G
R
AND
AND
N
H
a
p
p
and
c
the
d
i
n
g
!
AND
the
in
r
K
and
in
i
n
′
s
K
the
n
g
a
L
i
n
and
p
r
the
j
and
c
t
i
s
r
and
a
d
and
f
the
r
d
and
in
and
l
the
p
m
and
n
t
.
GREENHappycoding!YourKevin 
′
 sKo n g a L in e p ro j ec t i sre a d y f or d e v e l o p m e n t .{NC}"


Save this script as `setup_konga_line.sh` and run it with:

 
```bash
bash setup_konga_line.sh
bash
cat > README.md << 'EOF'
Save this script as \`setup_konga_line.sh\` and run it with:

\`\`\`bash
bash setup_konga_line.sh
\`\`\`

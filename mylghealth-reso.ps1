$userChoice = 9999



function makeGUI{
    #Main Form window initialization
    Add-Type -AssemblyName System.Windows.Forms
    $main_form = New-Object System.Windows.Forms.Form
    $main_form.Text ='Resolution AutoCopier'
    $main_form.Width = 1080
    $main_form.Height = 200
    
    #Feedback Text Label
    Add-Type -AssemblyName System.Windows.Forms
    $outLabel = New-Object System.Windows.Forms.Label
    $outLabel.Text = "--placeholder--"
    $outLabel.Location = New-Object System.Drawing.Point(20, 130)
    $outLabel.AutoSize = $true
    $main_form.Controls.Add($outLabel)
    
    
    #MyLGHealth Button Declaration
    $mylgh_Button = New-Object System.Windows.Forms.Button
    $mylgh_Button.Location = New-Object System.Drawing.Size(20, 10)
    $mylgh_Button.Size = New-Object System.Drawing.Size(120,23)
    $mylgh_Button.Text = "MyLGHealth"
    $main_form.Controls.Add($mylgh_Button)


    $mylgh_Button.Add_Click({
        mylgh-copy
        $outLabel.Text = "Set Clipboard to MyLGHealth Resolution"
        }
    )

    #PDS Button Declaration
    $pds_Button = New-Object System.Windows.Forms.Button
    $pds_Button.Location = New-Object System.Drawing.Size(150, 10)
    $pds_Button.Size = New-Object System.Drawing.Size(120,23)
    $pds_Button.Text = "PDS"
    $main_form.Controls.Add($pds_Button)


    $pds_Button.Add_Click({
        pds-copy
        $outLabel.Text = "Set Clipboard to PDS Resolution"
        }
    )


    #DUO Button Declaration
    $duo_Button = New-Object System.Windows.Forms.Button
    $duo_Button.Location = New-Object System.Drawing.Size(280, 10)
    $duo_Button.Size = New-Object System.Drawing.Size(120,23)
    $duo_Button.Text = "Duo"
    $main_form.Controls.Add($duo_Button)


    $duo_Button.Add_Click({
        duo-copy
        $outLabel.Text = "Set Clipboard to DUO Resolution"
        }
    )


    $main_form.ShowDialog()
}


#Function to copy MyLGHealth unlock/password reset resolution
function mylgh-copy{
    cd C:\Users\conne\Desktop
    Get-Content mylghealth.txt | Set-Clipboard
    Write-Host "Copied MyLGHealth Resolution`n`n"
}

#Function to copy Resolution for PDS 
function pds-copy{
    cd C:\Users\conne\Desktop
    Get-Content pds.txt | Set-Clipboard
    Write-Host "Copied PDS Resolution`n`n"
}

#Function to copy Resolution for DUO
function duo-copy{
    cd C:\Users\conne\Desktop
    Get-Content duo.txt | Set-Clipboard
    Write-Host "Copied DUO Resolution`n`n"
}

#CLI Menu for copying commands
function cli-copyier{
    while($userChoice -ne 0){
          Write-Host 
"------------------------------------`n
Please choose a resolution to copy`n
------------------------------------`n
1: MyLGHealth`n
2: PDS`n
3: DUO`n
0: Quit`n"
          $userChoice = Read-Host "Please enter your choise: "
          clear
           Switch($userChoice){
           1 {mylgh-copy}
           2 {pds-copy}
           3 {duo-copy}
           0 {break}
           }
    }
}
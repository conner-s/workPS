$userChoice = 9999


#Main GUI panel with buttons to autocopy and autoTicket
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



    #Auto MyLGHealth Ticket Button
    $autolghhealth_Button = New-Object System.Windows.Forms.Button
    $autolghhealth_Button.Location = New-Object System.Drawing.Size(20, 40)
    $autolghhealth_Button.Size = New-Object System.Drawing.Size(120,23)
    $autolghhealth_Button.Text = "Auto MyLGHealth"
    $main_form.Controls.Add($autolghhealth_Button)

    $autolghhealth_Button.Add_Click({
        open-MyLGHinput
        $outLabel.Text = "Opening Text for Ticket"
        }
    )

    #VDI Button Declaration
    $vdi_Button = New-Object System.Windows.Forms.Button
    $vdi_Button.Location = New-Object System.Drawing.Size(410, 10)
    $vdi_Button.Size = New-Object System.Drawing.Size(120,23)
    $vdi_Button.Text = "VDI"
    $main_form.Controls.Add($vdi_Button)


    $vdi_Button.Add_Click({
        vdi-copy
        $outLabel.Text = "Set Clipboard to VDI Resolution"
        }
    )


    $main_form.ShowDialog()
}






#TextBox form to submit a MyLGHealth Ticket
function open-MyLGHinput{
    #MyLGHealth Text Input window initialization
    Add-Type -AssemblyName System.Windows.Forms
    $myLGHealthPatient_form = New-Object System.Windows.Forms.Form
    $myLGHealthPatient_form.Text ='MyLGHealth AutoTicket'
    $myLGHealthPatient_form.Width = 400
    $myLGHealthPatient_form.Height = 400

    #Label instructing to Copy-Paste Patient overview info
    Add-Type -AssemblyName System.Windows.Forms
    $MyLGHTextBoxLabel = New-Object System.Windows.Forms.Label
    $MyLGHTextBoxLabel.Text = "Please Copy-Paste the patient's name and PCP"
    $MyLGHTextBoxLabel.Location = New-Object System.Drawing.Point(20, 5)
    $MyLGHTextBoxLabel.AutoSize = $true
    $myLGHealthPatient_form.Controls.Add($MyLGHTextBoxLabel)


    #Box to put Patient name and PCP
    $patTextBox = New-Object System.Windows.Forms.TextBox
    $patTextBox.Location = New-Object System.Drawing.Point(10,40)
    $patTextBox.Size = New-Object System.Drawing.Size(350,200)
    $patTextBox.AutoSize = $true
    $patTextBox.Multiline = $true
    $myLGHealthPatient_form.Controls.Add($patTextBox)


    #MyLGHealth Submit Button
    $MyLGHTextSub_Button = New-Object System.Windows.Forms.Button
    $MyLGHTextSub_Button.Location = New-Object System.Drawing.Size(260, 300)
    $MyLGHTextSub_Button.Size = New-Object System.Drawing.Size(120,23)
    $MyLGHTextSub_Button.Text = "Submit"
    $myLGHealthPatient_form.Controls.Add($MyLGHTextSub_Button)


    $MyLGHTextSub_Button.Add_Click({
        submitMyLGHealthTicketConfirm
        }
    )


    $myLGHealthPatient_form.ShowDialog()

}


#Confirmation Window to submit a ticket
function submitMyLGHealthTicketConfirm{
    #MyLGHealth Text Input window initialization
    Add-Type -AssemblyName System.Windows.Forms
    $myLGHealthPatientConfirm_form = New-Object System.Windows.Forms.Form
    $myLGHealthPatientConfirm_form.Text ='Confirm?'
    $myLGHealthPatientConfirm_form.Width = 300
    $myLGHealthPatientConfirm_form.Height = 125

    #Confirm?
    Add-Type -AssemblyName System.Windows.Forms
    $MyLGHConfirmLabel = New-Object System.Windows.Forms.Label
    $MyLGHConfirmLabel.Text = "Are you sure you would like to submit this ticket?"
    $MyLGHConfirmLabel.Location = New-Object System.Drawing.Point(20, 5)
    $MyLGHConfirmLabel.AutoSize = $true
    $myLGHealthPatientConfirm_form.Controls.Add($MyLGHConfirmLabel)



    #Submit button for AutoTicket 
    $MyLGHSubmit_Button = New-Object System.Windows.Forms.Button
    $MyLGHSubmit_Button.Location = New-Object System.Drawing.Size(10, 50)
    $MyLGHSubmit_Button.Size = New-Object System.Drawing.Size(120,23)
    $MyLGHSubmit_Button.Text = "Submit"
    $myLGHealthPatientConfirm_form.Controls.Add($MyLGHSubmit_Button)


    $MyLGHSubmit_Button.Add_Click({
        submitMyLGHealthTicket
        }
    )

    #Cancel button for AutoTicket
    $MyLGHCancel_Button = New-Object System.Windows.Forms.Button
    $MyLGHCancel_Button.Location = New-Object System.Drawing.Size(150, 50)
    $MyLGHCancel_Button.Size = New-Object System.Drawing.Size(120,23)
    $MyLGHCancel_Button.Text = "Cancel"
    $myLGHealthPatientConfirm_form.Controls.Add($MyLGHCancel_Button)


    $MyLGHCancel_Button.Add_Click({
        $myLGHealthPatientConfirm_form.Close()
        }
    )



    $myLGHealthPatientConfirm_form.ShowDialog()
}



function submitMyLGHealthTicket{
    Write-Host $patTextBox.Text
}



$workPath = $env:USERPROFILE + "\Desktop\PS scripts"


#Function to copy MyLGHealth unlock/password reset resolution
function mylgh-copy{
    cd $workPath
    Get-Content mylghealth.txt | Set-Clipboard
    Write-Host "Copied MyLGHealth Resolution`n`n"
}

#Function to copy Resolution for PDS 
function pds-copy{
    cd $workPath
    Get-Content pds.txt | Set-Clipboard
    Write-Host "Copied PDS Resolution`n`n"
}

#Function to copy Resolution for DUO
function duo-copy{
    cd $workPath
    Get-Content duo.txt | Set-Clipboard
    Write-Host "Copied DUO Resolution`n`n"
}

#Function to copy Resolution for VDI
function vdi-copy{
    cd $workPath
    Get-Content vdi.txt | Set-Clipboard
    Write-Host "Copied VDI Resolution`n`n"
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
4: VDI`n
0: Quit`n"
          $userChoice = Read-Host "Please enter your choise: "
          clear
           Switch($userChoice){
           1 {mylgh-copy}
           2 {pds-copy}
           3 {duo-copy}
           4 {vdi-copy}
           0 {break}
           }
    }
}

function reloadAPP{
    ipmo .\autoTicket.ps1 -Force
    makeGUI
}

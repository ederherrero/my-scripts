# Defina o nome da organização do GitHub
$organization = "sua-org"

# Obtém a lista de todos os repositórios da organização usando o GitHub CLI
$repos = gh repo list $organization --json name --limit 100 | ConvertFrom-Json

# Loop para baixar os repositórios em zip
foreach ($repo in $repos) {
    $repoName = $repo.name
    $zipUrl = "https://github.com/$organization/$repoName/archive/master.zip"
    $zipFilePath = "$repoName.zip"
    Invoke-WebRequest -Uri $zipUrl -OutFile $zipFilePath
    Write-Host "Repositório $repoName baixado com sucesso."
}

# Defined in - @ line 1
function update --wraps='sudo apt-get update && sudo apt-get upgrade -y' --description 'alias update sudo apt-get update && sudo apt-get upgrade -y'
  sudo apt-get update && sudo apt-get upgrade -y $argv;
end

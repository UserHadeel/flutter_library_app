
//email validation
bool validationEmailAddress(String input){
  const emailRegex='/^([\w]+([\w\.]*))(@)(uot)(\.)(edu)(\.)(ly)/';
  if(RegExp(emailRegex).hasMatch(input)){
    return true;
  }else
  return false;
}
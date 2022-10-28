{ config, pkgs, libs, ... }:

{
  programs.bash = {
    enable = true;
    enableCompletion = true;
    shellAliases = {
      "\.\." = "cd ..";
      "\.\.\." = "cd ../..";
      "\.\.\.\." = "cd ../../..";
      sudo = "sudo ";
      fuck = "sudo $(history - p !!)";
      ls = "ls --color\=always";
      las = "ls -h --author --time-style\=long-iso -dUl -- .* * | awk '{if(NR>2)print \$5, \$7, \$9}'";
      mkdir = "mkdir -pv";
      gs = "git status";
      gslog = "git shortlog";
      glog = "git log --pretty\=format:'%n%ar %n%Cred%h %Cblue%an <%ae> %n%Cgreen%s%n' --name-only";
      glogme = "glog --author\='\(Nicholas\)\|\(gebhartn\)'";
      vim = "nvim";
      ncmpcpp = "ncmpcpp - b ~/.config/ncmpcpp/bindings";
      pro = "cd ~/projects/";
      pkg = "cd ~/packages";
      dwn = "cd ~/media/downloads";
      mus = "cd ~/media/music";
    };
  };
}
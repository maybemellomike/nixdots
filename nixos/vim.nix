
{ config, pkgs, ... }:

{

  programs.neovim = {
	enable = true;
    defaultEditor = true;
    vimAlias = true; 
    configure = {
    customRC = ''
     set t_Co=256
            set paste
            setlocal formatoptions=1
            setlocal linebreak
            set thesaurus+=~/Documents/thesaur/mthesaur.txt
            set complete+=s
            set scrolloff=5
            set number relativenumber
            set path+=,**
            colorscheme gruvbox
            set ignorecase
            set cursorline
            set smartcase
            set mouse=a
            let g:transparent_enabled = v:true
            set noswapfile
            map<F7> :Yazi <CR>
            map <C-g> :Goyo <CR>
            map <C-z> :ZenMode <CR>
            map <C-l> :Limelight!! <CR>
            map <C-T> :Telescope find_files <CR>
            map <C-f> :Yazi <CR>
            map <C-p> :TypstWatch <CR>
            map <C-i> :! pdflatex %<CR><CR<>
            map <C-t> :! typst compile %<CR><CR<>
            map <C-s> :! zathura $(echo % \| sed 's/tex$/pdf/') & disown <CR><CR>
            set spell
            set spelllang=en_us 
            set termguicolors
    '';
       packages.myVimPackage = with pkgs.vimPlugins; {start = [
	    vim-nix
            limelight-vim
            oil-nvim 
            zen-mode-nvim
            typst-vim 
            nvim-cmp
            yazi-nvim
	    vim-pandoc
	    vim-airline
            vim-surround
            vimtex
	    goyo
            gruvbox
            oceanic-next
            transparent-nvim
            catppuccin-nvim
            rose-pine
            awesome-vim-colorschemes
            molokai
            everforest
	        ];
         };
      };
    };

}

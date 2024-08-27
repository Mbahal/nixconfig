{ pkgs, ... }:
{
  programs.nixvim =
    {
      viAlias = true;
      vimAlias = true;
      enable = true;
      colorschemes.kanagawa.enable = true;
      opts = {
        expandtab = true;
        shiftwidth = 2;
        smartindent = true;
        tabstop = 1;
        completeopt = "menu,noinsert,preview";
        hidden = true;
        ignorecase = true;
        joinspaces = false;
        scrolloff = 4;
        shiftround = true;
        sidescrolloff = 8;
        smartcase = true;
        splitright = true;
        termguicolors = true;
        wildmode = "list:longest";
        list = true;
        number = true;
        relativenumber = true;
        wrap = false;
        undofile = true;
        clipboard = "unnamedplus";
        cursorcolumn = true;
        spell = true;
      };
    
      globals = {
        mapleader = " ";
      };

      filetype = {
        pattern = {
          ".*.typ" = "typst";
        };
      };
      plugins = {
        # coq-nvim = {
        #   enable = true;
        #   autoStart = "shut-up";
        #   installArtifacts = true;
        # };
        cmp = {
          enable = true;
          settings = {
            mapping = {
              "<CR>" = "cmp.mapping.confirm({ select = false })";
              "<Down>" = "cmp.mapping.select_next_item({})";
              "<Up>" = "cmp.mapping.select_prev_item({})";
            };

#            snippet.expand = "function(args) require('luasnip').lsp_expand(args.body) end";

            sources = [
              { name = "path"; }
              { name = "nvim_lsp"; }
#              { name = "luasnip"; }
              {
                name = "buffer";
                option.get_bufnrs.__raw = "vim.api.nvim_list_bufs";
              }
            ];
          };
        };

        nvim-autopairs.enable = true;
      #  luasnip.enable = true;
        treesitter = {
          enable = true;
        };
        trouble = {
          enable = true;
        };
        gitsigns = {
          enable = true;
        };
        crates-nvim = {
          enable = true;
        };
        comment = {
          enable = true;
        };
        fidget = {
          enable = true;
        };
        lualine = {
          enable = true;
        };
        undotree = {
          enable = true;
        };
        neogit = {
          enable = true;
        };
        neorg = {
          enable = true;
        };
        treesitter-context = {
          enable = true;
        };
        telescope = {
          enable = true;
        };
        rustaceanvim = {
          enable = true;
        };
        lsp-lines = {
          enable = true;
        };
        lspsaga = {
          enable = true;
        };
        leap = {
          enable = true;
        };
        neogen = {
          enable = true;
        };
        wilder = {
          enable = true;
          modes = [ ":" "/" "?" ];
        };
        diffview = {
          enable = true;
        };
        illuminate = {
          enable = true;
        };
        chadtree = {
          enable = true;
        };
        lsp = {
          enable = true;
          servers = {
            tsserver.enable = true;
            nil-ls = {
              enable = true;
            };
            pylsp = {
              enable = true;
              settings = {
                plugins = {
                  autopep8.enabled = false;
                  black.enabled = false;
                  flake8.enabled = false;
                  mccabe.enabled = false;
                  memestra.enabled = false;
                  pycodestyle.enabled = false;
                  pydocstyle.enabled = false;
                  isort.enabled = false;
                  pyflakes.enabled = false;
                  pylint.enabled = false;
                  pylsp_mypy.enabled = false;
                  yapf.enabled = false;
                };
              };
            };
            nixd = {
              enable = true; # k
            };
            bashls = {
              enable = true;
            };
          };
        };
        none-ls = {
          enable = true;
          sources = {
            diagnostics = {
              # shellcheck.enable = true;
              vale.enable = true;
              # vulture.enable = true;
              alex.enable = true;
              gitlint.enable = true;
              protolint.enable = true;
              # hadolint.enable = true;
              # luacheck.enable = true;
              mypy.enable = true;
              deadnix.enable = true;
              # pylint.enable = true;
              statix.enable = true;
            };
            formatting = {
              isort.enable = true;
              # jq.enable = true;
              stylua.enable = true;
              markdownlint.enable = true;
              prettier.enable = true;
              prettier.disableTsServerFormatter = true;
              #rustfmt.enable = true;
              black.enable = true;
              # sqlfluff.enable = true;
              protolint.enable = true;
              # taplo.enable = true;
              nixpkgs_fmt.enable = true;
              shfmt.enable = true;
            };
          };
        };
      };

      extraConfigLua = ''
        vim.diagnostic.config({ virtual_lines = false })
      '';
      extraPlugins = with pkgs.vimPlugins; [
        vim-hardtime
      ];
    };
}


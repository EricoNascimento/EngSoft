------------------------------------------------
--	Erico Nascimento Bornéo
--	1012960
------------------------------------------------
require( "iuplua" )
require("functions")
require("components")



------------------------------------------------
-- Inicia o menu do jogo
------------------------------------------------
menu = iup.hbox
		  {
			iup.fill {},
			iup.vbox
			{
			  iup.fill{},
			  iup.fill{},
			  title,
			  iup.fill{},
			  btn_IniciaJogo,
			  iup.fill{},
			  iup.fill{};
			  -- Sets alignment and margin of vbox
			  alignment = "ACENTER",
			},
			iup.fill {}
		  }

dlg_menu = iup.dialog{ menu; title = "Menu", resize = "NO", menubox = "NO", maxbox = "NO", minbox = "NO",size="200x200" }
dlg_menu:showxy( iup.CENTER, iup.CENTER)

------------------------------------------------
-- Monta o tabuleiro
------------------------------------------------
iup.Append(vbox,headerTab)

local i = 0
while(i<10) do

	pos	= iup.label { title = "0",
                  bgcolor = "255 255 0",
                  fgcolor = "255 0 0",
                  font = "COURIER_BOLD_14"}

	color	= iup.label { title = "0",
                  bgcolor = "255 255 0",
                  fgcolor = "0 0 255",
                  font = "COURIER_BOLD_14"}

	linha = iup.hbox{	iup.fill{},pos,color,
					iup.button{image = img_1,action=EscolherCor,tip="1"},
				    iup.button{image = img_1,action=EscolherCor,tip="2"},
				    iup.button{image = img_1,action=EscolherCor,tip="3"},
				    iup.button{image = img_1,action=EscolherCor,tip="4"},
					iup.fill{},
					ALIGNMENT="ACENTER",
					margin="0x2"
			  }
	if(i==0) then
	linha.active="YES"
	else
	linha.active="NO"
	end

	lista[i]=linha
	iup.Append(vbox,linha)


	i=i+1;
end

iup.Append(vbox,jogar)


if (iup.MainLoopLevel()==0) then
  iup.MainLoop()
end














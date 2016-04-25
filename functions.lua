------------------------------------------------
--	Erico Nascimento Bornéo
--	1012960
------------------------------------------------


function ConfirmaCor(color)
--------------------------------------------
--Registra a cor escolhida para uma posição
--da tentativa.
--Parameter:
--   color : objeto da cor escolhida
--------------------------------------------
btnAtual.image=color.image

local i =tonumber(btnAtual.tip)

if(color.tip=="Vermelho")then
tentativa[i]=1
elseif(color.tip=="Verde")then
tentativa[i]=2
elseif(color.tip=="Azul")then
tentativa[i]=3
elseif(color.tip=="Violeta")then
tentativa[i]=4
end

dialEscolha:hide()

end



function EscolherCor(posicao)
--------------------------------------------
--Abre a interface que permite a escoha da cor
-- para uma posição da tentativa.
--Parameter:
--    posicao : posicao da tentativa
--------------------------------------------

btnAtual=posicao
escolha= iup.hbox{	iup.fill{},
					iup.button{image = img_2,action=ConfirmaCor,tip="Vermelho"},
				    iup.button{image = img_3,action=ConfirmaCor,tip="Verde"},
					iup.button{image = img_4,action=ConfirmaCor,tip="Azul"},
					iup.button{image = img_5,action=ConfirmaCor,tip="Violeta"},
					iup.fill{},
				    ALIGNMENT="ACENTER",
					margin="0x2"
				 }
dialEscolha=iup.dialog{escolha;title="Escolha uma cor",resize="NO",size="170x50"}
dialEscolha:showxy( iup.CENTER, iup.CENTER)
end


function calculaAcertos()
--------------------------------------------
--Calcula a quantidade de acertos de posições
-- e cores
--------------------------------------------
local i=1
local j=1
local incPontuacaoCor=true

while(j<5) do
	while(i<5) do

		if(tentativa[j]==resposta[i])then
			if(incPontuacaoCor) then
			qtdAcertosCor=qtdAcertosCor+1
			incCor=false
			end
			if(i==j)then
			qtdAcertosPos=qtdAcertosPos+1
			break
			end
		end
	i=i+1
	end
	i=1
	j=j+1
	incPontuacaoCor=true
end


end

function isVencedor()
--------------------------------------------
--Verifica se o jogador ganhou
--Parameter:
--------------------------------------------
if(qtdAcertosPos>=4 and qtdAcertosCor>=4) then
iup.Message("Parabéns!!!","Você ganhou!!!")
tabuleiro:hide()
end
end

function isPerdedor()
--------------------------------------------
--Verifica se o jogador perdeu
--Parameter:
--------------------------------------------
if(tentativas==10)then
iup.Message("Mais sorte na próxima.","Você perdeu")
tabuleiro:hide()
end
end

function atualizaTabuleiro()
--------------------------------------------
--Atualiza o tabuleiro após uma jogada
--Parameter:
--------------------------------------------
local i=0

lista[tentativas][2].title=qtdAcertosPos
lista[tentativas][3].title=qtdAcertosCor
tentativas=tentativas+1

while(i<10) do
	if(i==tentativas) then
		lista[i].active="YES"
	else
		lista[i].active="NO"
	end
	iup.Refresh(lista[i])
	i=i+1
end

tentativa[1]=0
tentativa[2]=0
tentativa[3]=0
tentativa[4]=0
end

function FazerJogada()
--------------------------------------------
--Realiza a tentativa de uma resposta para o resultado.
--------------------------------------------
calculaAcertos()
atualizaTabuleiro()
isVencedor()
isPerdedor()

end


function IniciaJogo()
--------------------------------------------
--Inicia o jogo
--------------------------------------------
  tabuleiro:showxy( iup.CENTER, iup.CENTER)
  dlg_menu:hide()
end


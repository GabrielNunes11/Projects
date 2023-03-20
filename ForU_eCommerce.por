programa {
	inclua biblioteca Tipos--> t
	inclua biblioteca Util --> u
	inclua biblioteca Matematica--> m
	
	const inteiro linhaUsuario=10, colunaUsuario=2, linha=12, coluna=7
	inteiro opcao, juros=10, cont=0
	cadeia simNao, opCod, produto, categoria, carrinho[10][3], login, senha,
	     matrizUsuarios[linhaUsuario][colunaUsuario] = {
		{"4Uadm", "adm1234adm"},
		{"Gabriel", "12345A"},
		{"Jorge", "12345B"},
		{"Milena", "12345C"},
		{"Natalie", "12345D"},
	     {"Rodrigo", "12345D"},
		{"", ""},
		{"", ""},
		{"", ""},
		{"", ""}
	     },
		produtos[linha][coluna] = {
          {"1", "Moda Casual", "Blusa", "Blusa Feminina de viscolycra, diversas cores e tamanhos.", "500", "22.00", "desc"},
          {"1", "Moda Casual", "Calça", "Calça de linho, diversas cores e tamanhos.", "300", "60.99", "desc"},
          {"1", "Moda Casual", "Casaco", "Casaco de couro, diversas cores e tamanhos.", "350", "90.00", "desc"},
          {"2", "Moda Social", "Vestido Longo", "Vestido longo de linho, diversas cores e tamanhos.", "400", "99.00", "desc"},
          {"2", "Moda Social", "Vestido Curto", "Vestido curto de viscose, diversas cores e tamanhos.", "380", "69.99", "desc"},
          {"2", "Moda Social", "Terno", "Terno de linho, diversas cores e tamanhos.", "200", "100.00", "desc"},
          {"3", "Acessórios", "Bolsa", "Bolsa de couro, diversas cores e tamanhos.", "150", "79.99", "desc"},
          {"3", "Acessórios", "Óculos", "Óculos de sol feminino, diversos modelos.", "200", "89.00", "desc"},
          {"3", "Acessórios", "Relógio", "Relógio feminino, diversos modelos.", "190", "99.99", "desc"},
          {"", "", "", "", "", "", ""},
          {"", "", "", "", "", "", ""},
          {"", "", "", "", "", "", ""}
    		}	
	
	funcao inicio(){
		saudacao()
	}

	funcao saudacao (){
		escreva("\n")
		espaco_nove()
		logo_quatro()
		espaco_cinquentatres()
		escreva("\\")
		espaco_dois()
		reta()
		espaco_dois()
		escreva("/")
		escreva("\n")
		espaco_oito()
		logo_cinco()
		espaco_cinquenta()
		escreva("\\")
		espaco_quatro()
		logo_tres()
		espaco_quatro()
		escreva("/")
		escreva("\n")
		espaco_sete()
		logo_dois()
		espaco_dois()
		logo_dois()
		espaco_cinquentatres()
		logo_sete()
		escreva("\n")
		espaco_seis()
		logo_dois()
		espaco_tres()
		logo_dois()
		espaco_quarentanove()
		travessao_dois()
		espaco_dois()
		logo_nove()
		espaco_dois()
		travessao_dois()
		escreva("\n")
		espaco_cinco()
		logo_dois()
		espaco_quatro()
		logo_dois()
		espaco_cinquentatres()
		logo_sete()
		escreva("\n")
		espaco_quatro()
		logo_dois()
		espaco_cinco()
		logo_dois()
		espaco_cinco()
		logo_dois()
		espaco_doze()
		escreva("-Acessar seu perfil?-")
		espaco_dez()
		escreva("/")
		espaco_quatro()
		logo_tres()
		espaco_quatro()
		escreva("\\")
		escreva("\n")
		espaco_quatro()
		logo_nove()
		espaco_cinco()
		logo_dois()
		espaco_quarentaseis()
		escreva("/")
		espaco_dois()
		reta()
		espaco_tres()
		escreva("\\")
		escreva("\n")
		espaco_quatro()
		logo_nove()
		espaco_cinco()
		logo_dois()
		escreva("\n")
		espaco_onze()
		logo_dois()
		espaco_cinco()
		logo_dois()
		escreva("\n")
		espaco_onze()
		logo_nove()
		escreva("\n")
		espaco_onze()
		logo_nove()
		espaco_vinteum()
		escreva("S/N ? ")
		simOuNao ()
	}

	funcao entrada(){
		escreva("\n")
		espaco_nove()
		logo_quatro()
		espaco_cinquentatres()
		escreva("\\")
		espaco_dois()
		reta()
		espaco_dois()
		escreva("/")
		escreva("\n")
		espaco_oito()
		logo_cinco()
		espaco_cinquenta()
		escreva("\\")
		espaco_quatro()
		logo_tres()
		espaco_quatro()
		escreva("/")
		escreva("\n")
		espaco_sete()
		logo_dois()
		espaco_dois()
		logo_dois()
		espaco_cinquentatres()
		logo_sete()
		escreva("\n")
		espaco_seis()
		logo_dois()
		espaco_tres()
		logo_dois()
		espaco_quarentanove()
		travessao_dois()
		espaco_um()
		logo_nove()
		espaco_um()
		travessao_dois()
		escreva("\n")
		espaco_cinco()
		logo_dois()
		espaco_quatro()
		logo_dois()
		espaco_cinquentatres()
		logo_sete()
		escreva("\n")
		espaco_quatro()
		logo_dois()
		espaco_cinco()
		logo_dois()
		espaco_cinco()
		logo_dois()
		espaco_dezenove()
		escreva("-Entrar-")
		espaco_dezesseis()
		escreva("/")
		espaco_quatro()
		logo_tres()
		espaco_quatro()
		escreva("\\")
		escreva("\n")
		espaco_quatro()
		logo_nove()
		espaco_cinco()
		logo_dois()
		espaco_quarentaseis()
		escreva("/")
		espaco_dois()
		reta()
		espaco_tres()
		escreva("\\")
		escreva("\n")
		espaco_quatro()
		logo_nove()
		espaco_cinco()
		logo_dois()
		escreva("\n")
		espaco_onze()
		logo_dois()
		espaco_cinco()
		logo_dois()
		escreva("\n")
		espaco_onze()
		logo_nove()
		escreva("\n")
		espaco_onze()
		logo_nove()
		espaco_dezessete()
		escreva("Login: ")
       	leia(login)
        	se (login == "" ou login == " ") {
        		escreva("Usuário inexistente!")
           	u.aguarde(1000)
            	limpa()
            	entrada()
        	}senao {
        		espaco_trintasete()
        		escreva("Senha: ")
        		leia(senha)
        	 }
        	se (senha == "" ou senha == " ") {
            	escreva("erro! tente novamente")
            	u.aguarde(1000)
            	limpa()
            	entrada()
        	}senao {
        		verificaLogin()
        	 }
	}

	funcao verificaLogin(){
		logico logado = falso
		se(login!="" ou login!=" " e senha!="" ou senha!="") {
			enquanto (logado == falso) {
				para(inteiro i=0; i<linhaUsuario; i++) {
					se(login==matrizUsuarios[i][0] e senha==matrizUsuarios[i][1]) {
						logado = verdadeiro
						se (login==matrizUsuarios[0][0] e senha==matrizUsuarios[0][1]) {
							menuAdm ()
						}
						senao se  (login!=matrizUsuarios[0][0] e senha!=matrizUsuarios[0][1])  {
							limpa()
							escreva("Bem vindo(a), " + matrizUsuarios[i][0] + "! \n")
							MenuPrincipal()
						}
					}
				}
				se (logado==falso) {
					limpa()
					escreva ("Login ou Senha incorretos.\n")
					escreva ("Gostaria de tentar novamente? S/N \n")
					simOuNao ()
					retorne
				}
			}
		}
	}

	funcao MenuPrincipal(){
		limpa()
		espaco_tres()
		logo_quatro()
		espaco_vinteseis()
		escreva("—Menu Principal—")
		ecomenu()
		ecodezessete()
		escreva("\n")
		espaco_dezesseis()
		reta()
		espaco_um()
		escreva("1 - Categorias")
		espaco_dois()
		reta()
		espaco_um()
		escreva("2 - Produtos")
		espaco_quatro()
		reta()
		espaco_um()
		escreva("3 - Checkout")
		espaco_quatro()
		reta()
		ecodezessete()
		escreva("\n")
		espaco_dezesseis()
		reta()
		espaco_um()
		escreva("4 - Login")
		espaco_sete()
		reta()
		espaco_um()
		escreva("5 - Admin")
		espaco_sete()
		reta()
		espaco_um()
		escreva("6 - Sair")
		espaco_oito()
		reta()
		ecodezessete()
		escreva("\n\n")
		espaco_trintadois()
		escreva("Escolha uma opcao: ")
		leia(opCod)
		limpa()
			se (opCod=="0" ou opCod=="1" ou opCod=="2" ou opCod=="3" ou opCod=="4" ou opCod=="5" 
				ou opCod=="6" ou opCod=="7" ou opCod=="8" ou opCod=="9"){			
					opcao = t.cadeia_para_inteiro(opCod, 10)
					escolha (opcao){
						caso 1: 
						MenuCategorias() 
						pare 
						caso 2: menuProdutos() 
						pare 
						caso 3: Checkout()
						pare 
						caso 4: 
						entrada()
						pare
						caso 5: 
						entrada() 
						pare
						caso 6: 
						fim()
						pare
						caso contrario: 
							inexistente()
							MenuPrincipal()
					}
			}
			senao{
				inexistente()
				MenuPrincipal()
			}
	}

	funcao MenuCategorias(){
		espaco_tres()
		logo_quatro()
		espaco_vinteseis()
		escreva("—Menu de Categorias—")
		ecomenu()
		ecodezoito()
		escreva("\n")
		espaco_dezessete()
		reta()
		espaco_um()
		escreva("1 - Moda Casual")
		espaco_dois()
		reta()
		espaco_um()
		escreva("2 - Moda Social")
		espaco_dois()
		reta()
		espaco_um()
		escreva("3 - Acessórios")
		espaco_tres()
		reta()
		ecodezoito()
		escreva("\n")
		espaco_dezessete()
		reta()
		espaco_um()
		escreva("4 - Checkout")
		espaco_cinco()
		reta()
		espaco_um()
		escreva("5 - Menu")
		espaco_nove()
		reta()
		espaco_um()
		escreva("6 - Sair")
		espaco_nove()
		reta()
		ecodezoito()
		escreva("\n\n")
		espaco_trintadois()
		escreva("Escolha uma opcao: ")
		leia(opCod)
		limpa()
			se (opCod=="0" ou opCod=="1" ou opCod=="2" ou opCod=="3" ou opCod=="4" ou opCod=="5" 
				ou opCod=="6" ou opCod=="7" ou opCod=="8" ou opCod=="9"){			
					opcao = t.cadeia_para_inteiro(opCod, 10)
					escolha (opcao){
						caso 1: 
						MenuCasual() 
						pare 
						caso 2: 
						MenuSocial() 
						pare 
						caso 3: 
						Acessorios() 
						pare
						caso 4: 
						Checkout() 
						pare
						caso 5: 
						MenuPrincipal() 
						pare
						caso 6: 
						fim()
						pare 
						caso contrario: 
							inexistente()
							MenuCategorias()
					}
			}
			senao {
				inexistente()
				MenuCategorias()
			}
	}

	funcao MenuCasual(){
		espaco_tres()
		logo_quatro()
		espaco_vinteseis()
		escreva("—Menu Casual—")
		ecomenu()
		ecodezeseis()
		escreva("\n")
		espaco_quinze()
		reta()
		espaco_um()
		escreva("1 - Blusa")
		espaco_seis()
		reta()
		espaco_um()
		escreva("2 - Calça")
		espaco_seis()
		reta()
		espaco_um()
		escreva("3 - Casaco")
		espaco_cinco()
		reta()
		ecodezeseis()
		escreva("\n")
		espaco_quinze()
		reta()
		espaco_um()
		escreva("4 - Checkout")
		espaco_tres()
		reta()
		espaco_um()
		escreva("5 - Menu")
		espaco_sete()
		reta()
		espaco_um()
		escreva("6 - Sair")
		espaco_sete()
		reta()
		ecodezeseis()
		escreva("\n\n")
		espaco_trintadois()
		escreva("Escolha uma opcao: ")
		leia(opCod)
		limpa()
			se (opCod=="0" ou opCod=="1" ou opCod=="2" ou opCod=="3" ou opCod=="4" ou opCod=="5" 
				ou opCod=="6" ou opCod=="7" ou opCod=="8" ou opCod=="9"){			
					opcao = t.cadeia_para_inteiro(opCod, 10)
					escolha (opcao){
						caso 1:blusa()
						pare 
						caso 2: calca()
						pare 
						caso 3: casaco()
						pare
						caso 4: 
						Checkout()  
						pare
						caso 5: 
						MenuPrincipal() 
						pare
						caso 6: fim() 
						pare
						caso contrario: 
							inexistente()
							MenuCasual()
					}
			}
			senao{
				inexistente()
				MenuCasual()
			}
	}

	funcao MenuSocial(){
		espaco_tres()
		logo_quatro()
		espaco_vinteseis()
		escreva("—Menu Social—")
		ecomenu()
		ecodezenove()
		escreva("\n")
		espaco_dezoito()
		reta()
		espaco_um()
		escreva("1 - Vestido Longo")
		espaco_um()
		reta()
		espaco_um()
		escreva("2 - Vestido Curto")
		espaco_um()
		reta()
		espaco_um()
		escreva("3 - Terno")
		espaco_nove()
		reta()
		ecodezenove()
		escreva("\n")
		espaco_dezoito()
		reta()
		espaco_um()
		escreva("4 - Checkout")
		espaco_seis()
		reta()
		espaco_um()
		escreva("5 - Menu")
		espaco_dez()
		reta()
		espaco_um()
		escreva("6 - Sair")
		espaco_dez()
		reta()
		ecodezenove()
		escreva("\n\n")
		espaco_trintadois()
		escreva("Escolha uma opcao: ")
		leia(opCod)
		limpa()
			se (opCod=="0" ou opCod=="1" ou opCod=="2" ou opCod=="3" ou opCod=="4" ou opCod=="5" 
				ou opCod=="6" ou opCod=="7" ou opCod=="8" ou opCod=="9"){			
				opcao = t.cadeia_para_inteiro(opCod, 10)
				escolha (opcao){
					
					caso 1: 
					vestidoLongo()
					pare 
					
					caso 2: 
					vestidoCurto() 
					pare 
					
					caso 3: 
					terno() 
					pare 
					
					caso 4: 
					Checkout() 
					pare
					
					caso 5: 
					MenuPrincipal() 
					pare
					
					caso 6: 
					fim() 
					pare
					
					caso contrario: 
					inexistente()
					MenuSocial()
					}
			}
			senao{
				inexistente()
				MenuSocial()
			}
	}

	funcao Acessorios(){
		espaco_tres()
		logo_quatro()
		espaco_vinteseis()
		escreva("—Acessórios—")
		ecomenu()
		ecodezessete()
		escreva("\n")
		espaco_dezesseis()
		reta()
		espaco_um()
		escreva("1 - Bolsa")
		espaco_sete()
		reta()
		espaco_um()
		escreva("2 - Óculos")
		espaco_seis()
		reta()
		espaco_um()
		escreva("3 - Relógio")
		espaco_cinco()
		reta()
		ecodezessete()
		escreva("\n")
		espaco_dezesseis()
		reta()
		espaco_um()
		escreva("4 - Checkout")
		espaco_quatro()
		reta()
		espaco_um()
		escreva("5 - Menu")
		espaco_oito()
		reta()
		espaco_um()
		escreva("6 - Sair")
		espaco_oito()
		reta()
		ecodezessete()
		escreva("\n\n")
		espaco_trintadois()
		escreva("Escolha uma opcao: ")
		leia(opCod)
		limpa()
			se (opCod=="0" ou opCod=="1" ou opCod=="2" ou opCod=="3" ou opCod=="4" ou opCod=="5" 
				ou opCod=="6" ou opCod=="7" ou opCod=="8" ou opCod=="9"){			
				opcao = t.cadeia_para_inteiro(opCod, 10)
				escolha (opcao){
					caso 1: bolsa() 
					pare 
					caso 2: oculos() 
					pare 
					caso 3: relogio() 
					pare 
					caso 4: Checkout()  
					pare
					caso 5: MenuPrincipal() 
					pare
					caso 6: 
					fim() 
					pare
					caso contrario: 
						inexistente()
						Acessorios()
					}
			}
				senao{
					inexistente()
					Acessorios()
				}
	}

	funcao menuProdutos(){
		espaco_tres()
		logo_quatro()
		espaco_vinteseis()
		escreva("—Produtos—")
		ecomenu()
		ecodezenove()
		escreva("\n")
		espaco_dezoito()
		reta()
		espaco_um()
		escreva("1 - Blusa")
		espaco_nove()
		reta()
		espaco_um()
		escreva("2 - Casaco")
		espaco_oito()
		reta()
		espaco_um()
		escreva("3 - Calça")
		espaco_nove()
		reta()
		ecodezenove()
		escreva("\n")
		espaco_dezoito()
		reta()
		espaco_um()
		escreva("4 - Vestido Longo")
		espaco_um()
		reta()
		espaco_um()
		escreva("5 - Vestido Curto")
		espaco_um()
		reta()
		espaco_um()
		escreva("6 - Terno")
		espaco_nove()
		reta()
		ecodezenove()
		escreva("\n")
		espaco_dezoito()
		reta()
		espaco_um()
		escreva("7 - Bolsa")
		espaco_nove()
		reta()
		espaco_um()
		escreva("8 - Óculos")
		espaco_oito()
		reta()
		espaco_um()
		escreva("9 - Relógio")
		espaco_sete()
		reta()
		ecodezenove()
		escreva("\n")
		espaco_dezoito()
		reta()
		espaco_um()
		escreva("10 - Checkout")
		espaco_cinco()
		reta()
		espaco_um()
		escreva("11 - Menu")
		espaco_nove()
		reta()
		espaco_um()
		escreva("12 - Sair")
		espaco_nove()
		reta()
		ecodezenove()
		escreva("\n\nEscolha uma opcao: ")
		leia(opCod)
		limpa()
			se (opCod=="1" ou opCod=="2" ou opCod=="3" ou opCod=="4" ou opCod=="5" 
				ou opCod=="6" ou opCod=="7" ou opCod=="8" ou opCod=="9" ou opCod=="10" 
				 ou opCod=="11" ou opCod=="12" ou opCod=="13"){			
					opcao = t.cadeia_para_inteiro(opCod, 10)
					escolha (opcao){
						
						caso 1:
						blusa()
						pare 
						
						caso 2:
						casaco()
						pare 
						
						caso 3:
						calca()
						pare
						
						caso 4:
						vestidoLongo()
						pare 
						
						caso 5:
						vestidoCurto()
						pare 
						
						caso 6:
						terno()
						pare
						
						caso 7: 
						bolsa()
						pare
						
						caso 8: 
						oculos()
						pare 
						
						caso 9:
						relogio()
						pare
						
						caso 10:
						Checkout()
						pare
						
						caso 11:
						MenuCategorias()
						pare
						
						caso 12: 
						fim()
						pare
						
						caso contrario:  
						inexistente()
						menuProdutos()
					}	
			}
			senao {
				inexistente()
				menuProdutos()
			}		
	}

	funcao Checkout(){
		espaco_dez()
		escreva("Checkout\n")
		espaco_seis()
		underline_dezesseis()
		escreva("\n")
		espaco_dez()
		reta()
		espaco_seis()
		reta()
		escreva("\n")
		underline_dez()
		reta()
		underline_seis()
		reta()
		underline_dez()
		escreva("\n")
		reta()
		espaco_vinteseis()
		reta()
		escreva("\n")
		reta()
		espaco_dez()
		logo_quatro()
		espaco_doze()
		reta()
		escreva("\n")
		reta()
		espaco_nove()
		logo_dois()
		espaco_um()
		logo_dois()
		espaco_doze()
		reta()
		ecoCheck()
		reta()
		espaco_oito()
		logo_dois()
		espaco_dois()
		logo_dois()
		espaco_dois()
		logo_dois()
		espacoCheck()
		espaco_seis()
		reta()
		espaco_um()
		escreva("1 - Comprar")
		espaco_quatro()
		reta()
		espaco_um()
		escreva("2 - Carrinho")
		espaco_tres()
		reta()
		espaco_um()
		escreva("3 - Pagar")
		espaco_seis()
		reta()
		escreva("\n")
		reta()
		espaco_sete()
		logo_sete()
		espaco_dois()
		logo_dois()
		espacoCheck()
		ecoCheck()
		reta()
		espaco_doze()
		logo_dois()
		espaco_dois()
		logo_dois()
		espacoCheck()
		espaco_seis()
		reta()
		espaco_um()
		escreva("4 - Remover")
		espaco_quatro()
		reta()
		espaco_um()
		escreva("5 - Menu")
		espaco_sete()
		reta()
		espaco_um()
		escreva("6 - Sair")
		espaco_sete()
		reta()
		escreva("\n")
		reta()
		espaco_doze()
		logo_seis()
		espacoCheck()
		ecoCheck()
		reta()
		underline_vinteseis()
		reta()
		escreva("\n")
		espaco_cinquenta()
		escreva("Escolha uma opcao: ")
		leia(opCod)
		limpa()
		se (opCod=="0" ou opCod=="1" ou opCod=="2" ou opCod=="3" ou opCod=="4" ou opCod=="5" 
				ou opCod=="6" ou opCod=="7" ou opCod=="8" ou opCod=="9"){			
				opcao = t.cadeia_para_inteiro(opCod, 10)
					escolha (opcao){
						caso 1:
						MenuCategorias()
						pare 
						caso 2: 
						verCarrinho()
						pare 
						caso 3: 
						finalizarCompra()
						pare
						caso 4: 
						removerCarrinho()
						pare
						caso 5: 
						MenuPrincipal()
						pare
						caso 6:
						fim()
						caso contrario: 
						inexistente()
						MenuCasual()
					}
		}
			senao{
				inexistente()
				Checkout()
			}
	}

	funcao blusa(){
		espaco_seis()
		underline_cinco()
		espaco_quatro()
		underline_cinco()
		escreva("\n")
		espaco_cinco()
		escreva("/")
		espaco_cinco()
		logo_quatro()
		espaco_cinco()
		escreva("\\")
		escreva("\n")
		espaco_quatro()
		mangaesquerda()
		reta()
		espaco_tres()
		escreva("4U")
		espaco_tres()
		reta()
		mangadireita()
		escreva("\n")
		espaco_tres()
		escreva("/")
		underline_dois()
		escreva("/")
		espaco_um()
		meiocamisa()
		espaco_um()
		escreva("\\")
		underline_dois()
		escreva("\\")
		espaco_vintetres()
		escreva("Preço: R$: ", produtos[0][5], "\n")
		espaco_oito()
		meiocamisa()
		espaco_dois()
		espaco_vinteseis()
		escreva("(", produtos[0][4], " Disponíveis)\n")
		espaco_oito()
		meiocamisa()
		espaco_tres()
		escreva("\n")
		espaco_oito()
		meiocamisa()
		escreva("\n")
		espaco_oito()
		reta()
		underline_oito()
		reta()
		escreva("\n\nDescrição: ", produtos[0][3], "\n")
		escreva("\nDeseja adicionar produto ao carrinho (S/N)? ")
		leia (opCod)
			se (opCod == "s" ou opCod == "S"){
				limpa()
				adicionarCarrinho(produtos[0][2], produtos[0][5], produtos[0][6])
				u.aguarde(1500)
			}senao se(opCod == "n" ou opCod == "N"){
				limpa()
				MenuPrincipal()
			}
			senao {
				limpa()
				inexistente()
				blusa()
			}
	}

	funcao calca(){
		espaco_nove()
		underline_oito()
		escreva("\n")
		espaco_oito()
		reta()
		escreva("/")
		espaco_dois()
		escreva("|o")
		espaco_dois()
		escreva("\\")
		reta()
		espaco_vintetres()
		escreva("Preço: R$: ", produtos[1][5], "\n")
		espaco_oito()
		reta()
		espaco_tres()
		escreva("/")
		escreva("\\")
		espaco_tres()
		reta()
		espaco_vintetres()
		escreva(produtos[1][4], " Disponíveis")
		barracalca()
		barracalca()
		barracalca()
		barracalca()
		escreva("\n")
		espaco_oito()
		reta()
		underline_dois()
		reta()
		espaco_dois()
		reta()
		underline_dois()
		reta()
		escreva("\n\nDescrição: ", produtos[1][3], "\n")
		escreva("\nDeseja adicionar produto ao carrinho (S/N)? ")
		leia (opCod)
			se (opCod == "s" ou opCod == "S"){
				limpa()
				adicionarCarrinho(produtos[1][2], produtos[1][5], produtos[1][6])
				u.aguarde(1500)
			}senao se(opCod == "n" ou opCod == "N"){
				limpa()
				MenuPrincipal()
			}
			senao {
				limpa()
				inexistente()
				calca()
			}
	}

	funcao casaco(){
		espaco_doze()
		underline_um()
		escreva("\n")
		espaco_onze()
		escreva("/")
		espaco_um()
		escreva("\\")
		escreva("\n")
		espaco_seis()
		underline_quatro()
		escreva("(")
		espaco_tres()
		escreva(")")
		underline_quatro()
		escreva("\n")
		espaco_cinco()
		escreva("/")
		espaco_cinco()
		escreva("|")
		escreva("V")
		escreva("|")
		espaco_cinco()
		escreva("\\")
		escreva("\n")
		espaco_quatro()
		mangaesquerda()
		reta()
		espaco_dois()
		escreva("|")
		espaco_um()
		escreva("|")
		escreva("4U")
		reta()
		mangadireita()
		espaco_vintetres()
		escreva("Preço: R$: ", produtos[2][5], "\n")
		espaco_tres()
		mangaesquerda()
		espaco_um()
		meiocasaco()
		espaco_um()
		mangadireita()
		espaco_vintetres()
		escreva(produtos[2][4], " Disponíveis\n")
		espaco_dois()
		mangaesquerda()
		espaco_dois()
		reta()
		espaco_sete()
		reta()
		espaco_dois()
		mangadireita()
		escreva("\n")
		espaco_um()
		escreva("/")
		underline_dois()
		escreva("/")
		espaco_tres()
		meiocasaco()
		espaco_tres()
		escreva("\\")
		underline_dois()
		escreva("\\")
		escreva("\n")
		espaco_oito()
		meiocasaco()
		escreva("\n")
		espaco_oito()
		reta()
		underline_sete()
		reta()
		escreva("\n\nDescrição: ", produtos[2][3], "\n")
		escreva("\nDeseja adicionar produto ao carrinho (S/N)? ")
		leia (opCod)
			se (opCod == "s" ou opCod == "S"){
				limpa()
				adicionarCarrinho(produtos[2][2], produtos[2][5], produtos[2][6])
				u.aguarde(1500)
			}senao se(opCod == "n" ou opCod == "N"){
				limpa()
				MenuPrincipal()
			}
			senao {
				limpa()
				inexistente()
				casaco()
			}
	}

	funcao vestidoLongo(){
		espaco_sete()
		underline_cinco()
		espaco_dois()
		underline_cinco()
		escreva("\n")
		espaco_seis()
		escreva("/")
		underline_um()
		espaco_quatro()
		escreva("\\/")
		espaco_quatro()
		underline_um()
		escreva("\\")
		espaco_vintetres()
		escreva("Preço: R$: ", produtos[3][5], "\n")
		espaco_oito()
		reta()
		espaco_seis()
		escreva("4U")
		reta()
		espaco_vinteseis()
		escreva(produtos[3][4], " Disponíveis")
		pulameio()
		pulameio()
		escreva("\n")
		espaco_sete()
		escreva("/")
		espaco_dez()
		escreva("\\")
		escreva("\n")
		espaco_seis()
		escreva("/")
		espaco_doze()
		escreva("\\")
		escreva("\n")
		espaco_cinco()
		escreva("/")
		espaco_quatorze()
		escreva("\\")
		escreva("\n")
		espaco_quatro()
		escreva("/")
		espaco_dezesseis()
		escreva("\\")
		escreva("\n")
		espaco_tres()
		escreva("/")
		espaco_dezoito()
		escreva("\\")
		escreva("\n")
		espaco_dois()
		escreva("/")
		underline_vinte()
		escreva("\\")
		escreva("\n\nDescrição: ", produtos[3][3], "\n")
		escreva("\nDeseja adicionar produto ao carrinho (S/N)? ")
		leia (opCod)
			se (opCod == "s" ou opCod == "S"){
				limpa()
				adicionarCarrinho(produtos[3][2], produtos[3][5], produtos[3][6])
				u.aguarde(1500)
			}senao se(opCod == "n" ou opCod == "N"){
				limpa()
				MenuPrincipal()
			}
			senao {
				limpa()
				inexistente()
				vestidoLongo()
			}
	}

	funcao vestidoCurto(){
		espaco_sete()
		underline_cinco()
		espaco_dois()
		underline_cinco()
		escreva("\n")
		espaco_seis()
		escreva("/")
		underline_um()
		espaco_quatro()
		escreva("\\/")
		espaco_quatro()
		underline_um()
		escreva("\\")
		espaco_vintetres()
		escreva("Preço: R$: ", produtos[4][5], "\n")
		espaco_oito()
		reta()
		espaco_seis()
		escreva("4U")
		reta()
		espaco_vinteseis()
		escreva(produtos[4][4], " Disponíveis")
		pulameio()
		pulameio()
		escreva("\n")
		espaco_sete()
		escreva("/")
		espaco_dez()
		escreva("\\")
		escreva("\n")
		espaco_seis()
		escreva("/")
		espaco_doze()
		escreva("\\")
		escreva("\n")
		espaco_cinco()
		escreva("/")
		underline_quatorze()
		escreva("\\")
		escreva("\n\nDescrição: ", produtos[4][3], "\n")
		escreva("\nDeseja adicionar produto ao carrinho (S/N)? ")
		leia (opCod)
			se (opCod == "s" ou opCod == "S"){
				limpa()
				adicionarCarrinho(produtos[4][2], produtos[4][5], produtos[4][6])
				u.aguarde(1500)
			}senao se(opCod == "n" ou opCod == "N"){
				limpa()
				MenuPrincipal()
			}
			senao {
				limpa()
				inexistente()
				vestidoCurto()
			}
	}

	funcao terno(){
		espaco_seis()
		underline_seis()
		espaco_dois()
		underline_seis()
		escreva("\n")
		espaco_cinco()
		escreva("/")
		espaco_seis()
		escreva("\\/")
		espaco_seis()
		escreva("\\")
		escreva("\n")
		espaco_quatro()
		mangaesquerda()
		meiosembotao()
		mangadireita()
		escreva("\n")
		espaco_tres()
		mangaesquerda()
		espaco_um()
		meiocombotao()
		espaco_um()
		mangadireita()
		escreva("\n")
		espaco_dois()
		mangaesquerda()
		espaco_dois()
		meiosembotao()
		espaco_dois()
		mangadireita()
		escreva("\n")
		espaco_um()
		escreva("/")
		escreva("°°")
		escreva("/")
		espaco_tres()
		meiocombotao()
		espaco_tres()
		escreva("\\")
		escreva("°°")
		escreva("\\")
		escreva("\n")
		espaco_oito()
		meiosembotao()
		escreva("\n")
		espaco_oito()
		reta()
		underline_tres()
		escreva("\\/°")
		underline_dois()
		reta()
		espaco_vintetres()
		escreva("Preço: R$: ", produtos[5][5], "\n")
		espaco_nove()
		underline_oito()
		espaco_vinteseis()
		escreva(produtos[5][4], " Disponíveis\n")
		espaco_oito()
		reta()
		escreva("/")
		espaco_dois()
		escreva("|o")
		espaco_dois()
		escreva("\\")
		reta()
		escreva("\n")
		espaco_oito()
		reta()
		espaco_tres()
		escreva("/")
		escreva("\\")
		espaco_tres()
		reta()
		barracalca()
		barracalca()
		barracalca()
		barracalca()
		escreva("\n")
		espaco_oito()
		reta()
		underline_dois()
		reta()
		espaco_dois()
		reta()
		underline_dois()
		reta()
		escreva("\n\nDescrição: ", produtos[5][3], "\n")
		escreva("\nDeseja adicionar produto ao carrinho (S/N)? ")
		leia (opCod)
			se (opCod == "s" ou opCod == "S"){
				limpa()
				adicionarCarrinho(produtos[5][2], produtos[5][5], produtos[5][6])
				u.aguarde(1500)
			}senao se(opCod == "n" ou opCod == "N"){
				limpa()
				MenuPrincipal()
			}
			senao {
				limpa()
				inexistente()
				terno()
			}
	}

	funcao bolsa(){
		espaco_dez()
		underline_oito()
		escreva("\n")
		espaco_um()
		underline_oito()
		reta()
		underline_oito()
		reta()
		underline_oito()
		espaco_vintetres()
		escreva("Preço: R$: ", produtos[6][5], "\n")
		reta()
		espaco_doze()
		escreva("4U")
		espaco_doze()
		reta()
		espaco_vintedois()
		escreva(produtos[6][4], " Disponíveis\n")
		reta()
		espaco_oito()
		underline_dez()
		espaco_oito()
		reta()
		espacoBolsa()
		espacoBolsa()
		espacoBolsa()
		escreva("\n")
		reta()
		underline_vinteseis()
		reta()
		escreva("\n\nDescrição: ", produtos[6][3], "\n")
		escreva("\nDeseja adicionar produto ao carrinho (S/N)? ")
		leia (opCod)
			se (opCod == "s" ou opCod == "S"){
				limpa()
				adicionarCarrinho(produtos[6][2], produtos[6][5], produtos[6][6])
				u.aguarde(1500)
			}senao se(opCod == "n" ou opCod == "N"){
				limpa()
				MenuPrincipal()
			}
			senao {
				limpa()
				inexistente()
				bolsa()
			}
	}

	funcao oculos(){
		espaco_cinco()
		underline_dez()
		espaco_quatro()
		underline_dez()
		escreva("\n")
		underline_quatro()
		reta()
		escreva("4")
		espaco_nove()
		reta()
		escreva("——")
		reta()
		espaco_nove()
		escreva("U")
		reta()
		underline_quatro()
		espaco_quinze()
		escreva("Preço: R$: ", produtos[7][5], "\n")
		espaco_quatro()
		reta()
		underline_dez()
		reta()
		espaco_dois()
		reta()
		underline_dez()
		reta()
		espaco_dezenove()
		escreva(produtos[7][4], " Disponíveis")
		escreva("\n\nDescrição: ", produtos[7][3], "\n")
		escreva("\nDeseja adicionar produto ao carrinho (S/N)? ")
		leia(opCod)
			se (opCod == "s" ou opCod == "S"){
				limpa()
				adicionarCarrinho(produtos[7][2], produtos[7][5], produtos[7][6])
				u.aguarde(1500)
			}senao se(opCod == "n" ou opCod == "N"){
				limpa()
				MenuPrincipal()
			}
			senao {
				limpa()
				inexistente()
				oculos()
			}
	}

	funcao relogio(){
		espaco_oito()
		underline_seis()
		escreva("\n")
		espaco_oito()
		reta()
		underline_um()
		reta()
		reta()
		underline_um()
		reta()
		escreva("\n")
		espaco_oito()
		reta()
		espaco_quatro()
		reta()
		escreva("\n")
		espaco_oito()
		reta()
		espaco_quatro()
		reta()
		escreva("\n")
		espaco_sete()
		underline_um()
		reta()
		underline_quatro()
		reta()
		underline_um()
		escreva("\n")
		espaco_seis()
		escreva("/")
		espaco_tres()
		escreva("12")
		espaco_tres()
		escreva("\\")
		espaco_um()
		espaco_vintetres()
		escreva("Preço: R$: ", produtos[8][5], "\n")
		espaco_cinco()
		escreva("/")
		espaco_cinco()
		reta()
		espaco_quatro()
		escreva("\\")
		espaco_vintetres()
		escreva(produtos[8][4], " Disponíveis\n")
		espaco_quatro()
		reta()
		escreva("9")
		espaco_cinco()
		escreva("o———")
		espaco_um()
		escreva("3")
		reta()
		escreva("\n")
		espaco_cinco()
		escreva("\\")
		espaco_dez()
		escreva("/")
		escreva("\n")
		espaco_seis()
		escreva("\\")
		underline_tres()
		escreva("06")
		underline_tres()
		escreva("/")
		espaco_dez()
		escreva("\n")
		espaco_oito()
		reta()
		espaco_quatro()
		reta()
		escreva("\n")
		espaco_oito()
		reta()
		espaco_quatro()
		reta()
		escreva("\n")
		espaco_oito()
		reta()
		espaco_um()
		escreva("°°")
		espaco_um()
		reta()
		escreva("\n")
		espaco_oito()
		reta()
		underline_quatro()
		reta()
		escreva("\n\nDescrição: ", produtos[8][3], "\n")
		escreva("\nDeseja adicionar produto ao carrinho (S/N)? ")
		leia (opCod)
			se (opCod == "s" ou opCod == "S"){
				limpa()
				adicionarCarrinho(produtos[8][2], produtos[8][5], produtos[8][6])
				u.aguarde(1500)
			}senao se(opCod == "n" ou opCod == "N"){
				limpa()
				MenuPrincipal()
			}
			senao {
				limpa()
				inexistente()
				relogio()
			}
	}

	funcao adicionarCarrinho(cadeia nome, cadeia preco, cadeia desc){
		//o para precisa de 3 condiçoes, a primeira e um inteiro a segunda e uma condiçao e a terceira um encremento
		para (inteiro x= 0; x <10; x++){
			//esta checando se a coluna 0 da linha x e vazia, se for ele vai adcionare produto
			se (carrinho[x][0] == "" ) { 
				carrinho[x][0]	= nome
				carrinho[x][1] = preco
				carrinho[x][2] = desc
				verCarrinho()
				retorne 
			}
		}
		limpa()
		escreva("Carrinho já está cheio! Finalize esta compra e volte.")
		u.aguarde(2000)
		limpa()
		Checkout()
		retorne 	
	}

	funcao verCarrinho(){
		//o para precisa de 3 condiçoes, a primeira e um inteiro a segunda e uma condiçao e a terceira um encremento
	 	para (inteiro x=0; x <10; x++){
	 		//estou checado se a coluna 0 da linha x é diferente de vazio, se for ela mostra o produto no carrinho
	 	 	se (carrinho[x][0] != ""){
	 	 	 	escreva("Produto: ",carrinho[x][0], "\nPreço: ",carrinho[x][1], "\n\n")
	 	 	}senao{escreva("\nvazio\n")}
	 	 }
	 	 	escreva("\n\nDeseja finalizar sua compra? (S/N)? ")
			leia (opCod)
			se (opCod == "s" ou opCod == "S"){
				limpa()
				finalizarCompra()
			}senao se(opCod == "n" ou opCod == "N"){
				limpa()
				MenuPrincipal()
			}
			senao {
				limpa()
				inexistente()
				verCarrinho()
			}
	 	}
	 	 	 
	funcao finalizarCompra(){
     	//o para precisa de 3 condiçoes, a primeira e um inteiro a segunda e uma condiçao e a terceira um encremento
     	real subtotal = 0.0, total 
     	para (inteiro x=0; x<10; x++){
     		//checa se a coluna 1 da linha x e diferente de vazio, se for ela pega o preço e soma no subtotal
     		//carrinho[x][1]= e o indice do preço no produto
     		se (carrinho[x][1]!= ""){
     				
     			subtotal += Tipos.cadeia_para_real(carrinho[x][1]) 	
     		}
    		}
    		subtotal = Matematica.arredondar(subtotal, 2)
    		//metodo de pagamento retorna o preço total 
    		total = metodoDePagamento(subtotal)
    		limpa()
    	
     }
     
     funcao real metodoDePagamento(real subtotal){
    	 	caracter input
    	 	real total = 0.0, totalDin = 0.0, totalCred = 0.0

     	
     	escreva("\n")
     	escreva("***************4UPay****************\n")
     	escreva("---------FORMA DE PAGAMENTO---- ----\n")
     	escreva("***************4UPay****************\n")
     	escreva("\n")
     	escreva("\n")
     	escreva("1 - Dinheiro com 5% de desconto?\n")
     	escreva("\n")
     	escreva("2 - Débito?\n")
     	escreva("\n")
     	escreva("3 - Crédito com acréscimo no valor?\n")
     	escreva("\n")
     	escreva("\n")
     	escreva("SELECIONE UM MÉTODO DE PAGAMENTO: ")
     	leia(input) 
     		escolha(input){ 
           	caso Tipos.cadeia_para_caracter("1"): 
	  			total += subtotal
	  			total = subtotal * 0.95
	  			totalDin = m.arredondar(total, 2)
	  			escreva("\nSubtotal: R$", subtotal, "\nTotal: R$", totalDin, "\n")
	            	Util.aguarde (5000)
            	pare
           	caso Tipos.cadeia_para_caracter("2"):
	            	total += subtotal
	            	escreva("\nSubtotal: R$", subtotal, "\nTotal: R$", total, "\n")
	               Util.aguarde (5000)
               pare
            	caso Tipos.cadeia_para_caracter("3"):
	            	total = (juros * subtotal) / 100
	            	total = total + subtotal
	            	totalCred = m.arredondar(total, 2)
	            	escreva("\nSubtotal: R$", subtotal, "\nTotal: R$", totalCred, "\n")   
	            	Util.aguarde (5000)
            	pare
          	caso contrario:
	           	limpa()
	           	escreva("Não autorizada")
				Util.aguarde (2000)
	        	     limpa()
	        	     finalizarCompra()
     		}
     		retorne Matematica.arredondar(total,2)
    	}
     
     funcao removerCarrinho(){
     	caracter produtos 
     	limpa()
     	
     	escreva("\n")
     	escreva("***********************************\n")
     	escreva("--------------CARRINHO-------------\n")
     	escreva("***********************************\n")
     	escreva("\n")
     	para (inteiro x=0; x<9; x++){
     		escreva(x+1," - ", carrinho[x][0], " R$", carrinho[x][1]) 
     		escreva("\n")
     		
     	}
     	escreva(" \n\nDigite M para voltar ao menu: ")
     	leia(produtos)
     	se(produtos=='1' ou produtos=='2' ou produtos=='2' ou produtos=='3' ou produtos=='4' ou produtos=='5' 
     		ou produtos=='6' ou produtos=='7' ou produtos=='8' ou produtos=='9' ou produtos=='M' ou produtos=='m'){
     		escolha(produtos){
     		
     		caso Tipos.cadeia_para_caracter("1"):
     		carrinho[0][0] = ""
     		carrinho[0][1] = ""
     		carrinho[0][2] = ""
     		limpa()
     		verCarrinho()
     		pare 
     		
     		caso Tipos.cadeia_para_caracter("2"):
     		carrinho[1][0] = ""
     		carrinho[1][1] = ""
     		carrinho[1][2] = ""
     		limpa()
     		verCarrinho()
     		pare 
     		
     		caso Tipos.cadeia_para_caracter("3"):
     		carrinho[2][0] = ""
     		carrinho[2][1] = ""
     		carrinho[2][2] = ""
     		limpa()
     		verCarrinho()
     		pare 
     		
     		caso Tipos.cadeia_para_caracter("4"):
     		carrinho[3][0] = ""
     		carrinho[3][1] = ""
     		carrinho[3][2] = ""
     		limpa()
     		verCarrinho()
     		pare 
     		
     		caso Tipos.cadeia_para_caracter("5"):
     		carrinho[4][0] = ""
     		carrinho[4][1] = ""
     		carrinho[4][2] = ""
     		limpa()
     		verCarrinho()
     		pare 
     		
     		caso Tipos.cadeia_para_caracter("6"):
     		carrinho[5][0] = ""
     		carrinho[5][1] = ""
     		carrinho[5][2] = ""
     		limpa()
     		verCarrinho()
     		pare 
     		
     		caso Tipos.cadeia_para_caracter("7"):
     		carrinho[6][0] = ""
     		carrinho[6][1] = ""
     		carrinho[6][2] = ""
     		limpa()
     		verCarrinho()
     		pare 
     		
     		caso Tipos.cadeia_para_caracter("8"):
     		carrinho[7][0] = ""
     		carrinho[7][1] = ""
     		carrinho[7][2] = ""
     		limpa()
     		verCarrinho()
     		pare

     		caso Tipos.cadeia_para_caracter("9"):
     		carrinho[8][0] = ""
     		carrinho[8][1] = ""
     		carrinho[8][2] = ""
     		limpa()
     		verCarrinho()
     		pare 
     		
     		caso Tipos.cadeia_para_caracter("M"):
     		limpa()
     		MenuPrincipal()
     		pare  

     		caso Tipos.cadeia_para_caracter("m"):
     		limpa()
     		MenuPrincipal()
     		pare  
     	}
     	}
     	senao{
     		inexistente()
     		Checkout()
     	}
     }

     funcao verificaAdm(){
     	logico logado = falso
     	escreva("\n")
		espaco_nove()
		logo_quatro()
		espaco_cinquentatres()
		escreva("\\")
		espaco_dois()
		reta()
		espaco_dois()
		escreva("/")
		escreva("\n")
		espaco_oito()
		logo_cinco()
		espaco_cinquenta()
		escreva("\\")
		espaco_quatro()
		logo_tres()
		espaco_quatro()
		escreva("/")
		escreva("\n")
		espaco_sete()
		logo_dois()
		espaco_dois()
		logo_dois()
		espaco_cinquentatres()
		logo_sete()
		escreva("\n")
		espaco_seis()
		logo_dois()
		espaco_tres()
		logo_dois()
		espaco_quarentanove()
		travessao_dois()
		espaco_um()
		logo_nove()
		espaco_um()
		travessao_dois()
		escreva("\n")
		espaco_cinco()
		logo_dois()
		espaco_quatro()
		logo_dois()
		espaco_cinquentatres()
		logo_sete()
		escreva("\n")
		espaco_quatro()
		logo_dois()
		espaco_cinco()
		logo_dois()
		espaco_cinco()
		logo_dois()
		espaco_dezenove()
		escreva("-Admin-")
		espaco_dezessete()
		escreva("/")
		espaco_quatro()
		logo_tres()
		espaco_quatro()
		escreva("\\")
		escreva("\n")
		espaco_quatro()
		logo_nove()
		espaco_cinco()
		logo_dois()
		espaco_quarentaseis()
		escreva("/")
		espaco_dois()
		reta()
		espaco_tres()
		escreva("\\")
		escreva("\n")
		espaco_quatro()
		logo_nove()
		espaco_cinco()
		logo_dois()
		escreva("\n")
		espaco_onze()
		logo_dois()
		espaco_cinco()
		logo_dois()
		escreva("\n")
		espaco_onze()
		logo_nove()
		escreva("\n")
		espaco_onze()
		logo_nove()
		espaco_dezessete()
		escreva("Login: ")
       	leia(login)
        	se (login == "" ou login == " ") {
        		escreva("Usuário inexistente!")
           	u.aguarde(1000)
            	limpa()
            	entrada()
        	}senao {
        		espaco_trintasete()
        		escreva("Senha: ")
        		leia(senha)
        	 }
        	se (senha == "" ou senha == " ") {
            	escreva("erro! tente novamente")
            	u.aguarde(1000)
            	limpa()
            	entrada()
        	}senao se(login!="" ou login!=" " e senha!="" ou senha!="") {
			enquanto (logado == falso) {
				para(inteiro i=0; i<linhaUsuario; i++) {
					se(login==matrizUsuarios[0][0] e senha==matrizUsuarios[0][1]) {
						logado = verdadeiro
						se (login==matrizUsuarios[0][0] e senha==matrizUsuarios[0][1]) {
							menuAdm ()
						}
					}
				}
				se (logado==falso) {
					limpa()
					escreva ("Login ou Senha incorretos.\n")
					escreva ("Gostaria de tentar novamente? S/N \n")
					simOuNao ()
					retorne
				}
			}
		}
	}
	
	funcao menuAdm () {
		cadeia valor
		cadeia novoLogin, novaSenha
		limpa()
		logo_onze()
		escreva("4U.Net")
		logo_onze()
		escreva ("\n   Menu do administrador\n")
		escreva ("     Seja Bem-Vindo(a)!\n")
		escreva ("  O que gostaria de fazer?\n")
		logo_onze()
		escreva("4U.Net")
		logo_onze()
		escreva ("\n\n[1] Excluir usuário.\n")
		escreva ("[2] Alterar usuário.\n")
		escreva ("[3] Cadastrar novo usuário.\n")
		escreva ("[4] Excluir produto.\n")
		escreva ("[5] Alterar produto.\n")
		escreva ("[6] Cadastrar novo produto.\n")
		escreva ("[7] Sair.\n\n")
		leia(valor)
		se (t.cadeia_e_inteiro(valor,10)) {
			inteiro opt = t.cadeia_para_inteiro(valor,10) 
			se (valor=="1" ou valor=="2" ou valor=="3" ou valor=="4" ou valor=="5" ou valor=="6" ou valor=="7") {
				escolha (opt) {
					
					caso 1:
					excluirUsuario ()
					pare
					
					caso 2:
					alterarUsuario ()
					pare
					
					caso 3:
					cadastrarUsuario ()				
					pare
					
					caso 4:
					excluirProduto ()
					pare
					
					caso 5:
					alterarProduto ()
					pare
					
					caso 6:
					cadastrarProduto ()
					pare
					
					caso 7:
					limpa()
					inicio ()
					pare
				}
			}
		}
		senao {
			escreva ("Opcao invalida, tente novamente.\n")
			u.aguarde(1000)
			limpa()				
			menuAdm ()
		}
	}
	
	funcao excluirUsuario () {
		limpa()
		para(inteiro i=0; i<linhaUsuario;i++){
            escreva("Usuário: ", matrizUsuarios[i][0], "\n")
            }
        		escreva("\nDigite o nome do usuário que deseja excluir: \n")
        		leia(opCod)
           	para(inteiro i=0; i<linhaUsuario;i++){
                se (opCod != matrizUsuarios[i][0] ou opCod =="" ou opCod ==" "){
                	limpa()
                    escreva("Usuário inexistente")
                    u.aguarde(1000)
                    menuAdm()
                } senao {
                    matrizUsuarios[i][0] = ""
                    escreva("\nUsuário excluído com sucesso!\n")
                    menuAdm()
                }
           	}
		para(inteiro i=1; i<linhaUsuario; i++) {
			para(inteiro j=0; j<colunaUsuario; i++) {
				se (login==matrizUsuarios[i][0]) {
					limpa()
					escreva("Tem certeza que quer excluir o usuario "+ matrizUsuarios[i][0] +"? [S/N]\n")
					leia(simNao)
					se (simNao == "S" ou simNao == "s") {
						limpa()
						escreva ("Deletando login, aguarde.\n")
						u.aguarde(2000)
						matrizUsuarios[i][0] = ""
						limpa()
						escreva ("Login deletado.\n")
						escreva ("Deletando senha, aguarde.\n")
						u.aguarde(2000)
						matrizUsuarios[i][1] = ""
						limpa()
						escreva ("Usuário excluído com sucesso!\n")
						u.aguarde(1000)
						retornarMenuAdm ()
					}
					senao se (simNao == "N" ou simNao == "n") {
						retornarMenuAdm ()
					}
					senao {
						limpa()
						escreva ("Opção invalida!\n")
						u.aguarde(1000)
						retornarMenuAdm ()
					}
				}
			}
		}
	}

	funcao alterarUsuario () { 
		cadeia valor
		cadeia novoLogin, novaSenha
		limpa()
		escreva ("Digite o login do usuário que gostaria de alterar.\n")
		leia (login)
		se (login == "" ou login == " ") {
			escreva("Login inexistente. Por favor, tente novamente.")
			u.aguarde(1000)
			limpa()
			alterarUsuario()
	
		}
		senao {
			para(inteiro i=1; i<linhaUsuario; i++) {
				se (login==matrizUsuarios[i][0]) {
					limpa()
					escreva("Usuário selecionado: " + matrizUsuarios[i][0] +"\n")
					escreva("Qual dado gostaria de alterar?\n")
					escreva("[1] Login\n")
					escreva("[2] Senha\n")
					escreva("[3] Login & Senha\n")
					escreva("[4] Voltar ao Menu Admnistrador\n")
					leia(valor)
					se (t.cadeia_e_inteiro(valor,10)) {
						inteiro opt = t.cadeia_para_inteiro(valor,10)
						se (valor=="1" ou valor=="2" ou valor=="3" ou valor=="4") {
							escolha (opt) {
								caso 1:
								limpa()
								escreva("Digite o novo login:\n")
								leia (novoLogin)
								se (novoLogin == matrizUsuarios[i][1]) {
									limpa()
									escreva("Login não pode ser igual a senha. Por favor, tente novamente.\n")

								}
								senao se (novoLogin == "" ou novoLogin == " ") {
									escreva("Login inválido. Por favor, tente novamente.")
								}
								senao {
									limpa()
									matrizUsuarios[i][0] = novoLogin
									escreva("Login alterado com sucesso!\n")
								}
								u.aguarde(1000)
								retornarMenuAdm ()
								pare	

								caso 2: 
								limpa()
								escreva("Digite a nova senha:\n")
								leia (novaSenha)
								se (novaSenha == matrizUsuarios[i][0]) {
									limpa()
									escreva("Senha não pode ser a mesma do login. Por favor, tente novamente.\n")
								}
								senao se (novaSenha == "" ou novaSenha == " ") {
									escreva("Senha inválida. Por favor, tente novamente.")
								}
								senao {
									limpa()
									matrizUsuarios[i][1] = novaSenha
									escreva("Senha alterada com sucesso!\n")
								}
								u.aguarde(1000)
								retornarMenuAdm ()
								pare

								caso 3:
								limpa()
								escreva("Digite o novo login:\n")
								leia (novoLogin)
								se (novoLogin == matrizUsuarios[i][1]) {
									limpa()
									escreva("Login não pode ser igual a senha. Por favor, tente novamente.\n")	
								}
								senao se (novoLogin == "" ou novoLogin == " ") {
									escreva("Login inválido. Por favor, tente novamente.")
								}
								senao {
									limpa()
									matrizUsuarios[i][0] = novoLogin
									escreva("Login alterado com sucesso!\n")
								}
								limpa()
								escreva("Digite a nova senha:\n")
								leia (novaSenha)
								se (novaSenha == matrizUsuarios[i][0]) {
									limpa()
									escreva("Senha não pode ser a mesma do login. Por favor, tente novamente.\n")
								}
								senao se (novaSenha == "" ou novaSenha == " ") {
									escreva("Senha inválida. Por favor, tente novamente.")
								}
								senao {
									limpa()
									matrizUsuarios[i][1] = novaSenha
									escreva("Senha alterada com sucesso!\n")
								}
								u.aguarde(1000)
								retornarMenuAdm ()
								pare

								caso 4:
								limpa()
								menuAdm()
								pare
							}
						}
					}
					senao {
					escreva ("Opcao inválida, tente novamente.\n")
					u.aguarde(1000)
					limpa()				
					alterarUsuario ()
					}
			}
		}
		}
	}

	funcao cadastrarUsuario () {
		para(inteiro i=6; i<linhaUsuario; i++) {
			limpa()
			escreva("Cadastre o Login: ")
			leia(login)
			escreva("Cadastre a Senha: ")
			leia(senha)
			se (login == "" ou login == " " ou senha == "" ou senha ==" ") {
				escreva("Um ou ambos os valores são inválidos. Por favor, tente novamente.")
			}
			senao se (senha == login) {
				escreva ("Senha não pode ser a mesma do login. Por favor, tente novamente.\n")			
			}
			senao {			
				para(inteiro j=0; j<colunaUsuario; j++) {
					se (j==0) {
						limpa()
						matrizUsuarios[i][j] = login
						escreva("Login cadastrado com sucesso!\n")
						u.aguarde(1000)
					}
					senao {
						matrizUsuarios[i][j] = senha
						escreva("Senha cadastrado com sucesso!\n")
						u.aguarde(1000)
						limpa()
						escreva("Gostaria de cadastrar outro usuário? [S/N]\n")
						leia(simNao)
						se (simNao == "S" ou simNao == "s") { 
						}
						senao se (simNao == "N" ou simNao == "n") {
							limpa()
							retornarMenuAdm()
							retorne
						}
						senao {
							limpa()
							escreva ("Opção invalida!\n")
							u.aguarde(1000)
							escreva ("Finalizando aplicação.\n")
							limpa()
							fim()
							retorne
						}
					
					}
				}	
			}
			u.aguarde(2000)
			cadastrarUsuario ()	
		}
	}

	funcao excluirProduto () {
		limpa()
		para(inteiro i=0; i<linha;i++){
            escreva("Produto: ", produtos[i][2], "\n")
            }
        		escreva("\nDigite o nome do produto que deseja excluir: \n")
        		leia(opCod)
           	para(inteiro i=0; i<linha;i++){
               	se (opCod != produtos[i][2] ou opCod =="" ou opCod ==" "){
                		limpa()
                   		escreva("Produto inexistente")
                    	u.aguarde(1000)
                    	menuAdm()
                }senao {
                    produtos[i][2] = ""
                    escreva("\nProduto excluído com sucesso!\n")
                    menuAdm()
                 }
           	}
		para(inteiro i=0; i<linha; i++) {
			para(inteiro j=0; j<coluna; i++) {
				se (opCod == produtos[i][2]) {
					limpa()
					escreva("Tem certeza que quer excluir o produto "+ produtos[i][2] +"? [S/N]\n")
					leia(simNao)
					se (simNao == "S" ou simNao == "s") {
						limpa()
						escreva ("Deletando produto, aguarde.\n")
						u.aguarde(500)
						produtos[i][0] = ""
						limpa()
						escreva ("Deletando produto, aguarde. .\n")
						u.aguarde(500)
						produtos[i][1] = ""
						limpa()
						escreva ("Deletando produto, aguarde. . .\n")
						u.aguarde(500)
						produtos[i][2] = "Produto Indisponível"
						limpa()
						escreva ("Deletando produto, aguarde\n")
						u.aguarde(500)
						produtos[i][3] = ""
						limpa()
						escreva ("Deletando produto, aguarde.\n")
						u.aguarde(500)
						produtos[i][4] = ""
						limpa()
						escreva ("Deletando produto, aguarde. .\n")
						u.aguarde(500)
						produtos[i][5] = ""
						limpa()
						escreva ("Deletando produto, aguarde. . .\n")
						u.aguarde(500)
						produtos[i][6] = ""
						limpa()
						escreva ("Produto excluído com sucesso!\n")
						u.aguarde(1000)
						retornarMenuAdm ()
					}
					senao se (simNao == "N" ou simNao == "n") {
						retornarMenuAdm ()
					}
					senao {
						limpa()
						escreva ("Opção invalida!\n")
						u.aguarde(1000)
						retornarMenuAdm ()
					}
				}
			}
		}
	}

	funcao alterarProduto() { 
		cadeia valor, novaCatNum, novaCatNome, novoNome, novaDes, novaQnt, novoPreco, novoDesc
		
		limpa()
		para(inteiro i=0; i<linha;i++){
            escreva("Produto: ", produtos[i][2], "\n")
            }
        		escreva("\nDigite o nome do produto que deseja alterar: \n")
        		leia(opCod)
           	para(inteiro i=0; i<linha;i++){
               	se (opCod != produtos[i][2] ou opCod =="" ou opCod ==" "){
                		limpa()
                   		escreva("Produto inexistente")
                    	u.aguarde(1000)
                    	menuAdm()
                }
           	}
		para(inteiro i=0; i<linha; i++) {
			se (opCod==produtos[i][2]) {
				limpa()
				escreva("Produto selecionado: " + produtos[i][2] +"\n")
				escreva("Qual dado gostaria de alterar?\n")
				escreva("[1] Categoria\n")
				escreva("[2] Nome\n")
				escreva("[3] Descrição\n")
				escreva("[4] Quantidade\n")
				escreva("[5] Preço\n")
				escreva("[6] Desconto\n")
				escreva("[7] Voltar ao Menu Admnistrador\n")
				leia(valor)
				se (t.cadeia_e_inteiro(valor,10)) {
					inteiro opt = t.cadeia_para_inteiro(valor,10)
					se (valor=="1" ou valor=="2" ou valor=="3" ou valor=="4" ou valor=="5" ou valor=="6" ou valor=="7") {
						escolha (opt) {
							caso 1:
							limpa()
							escreva("Digite o número identificador da nova categoria:\n")
							leia (novaCatNum)
							se (novaCatNum == "1") {
								limpa()
								produtos[i][0] = novaCatNum
								escreva("Alterando categoria.")
								u.aguarde(500)
								escreva("Alterando categoria. .")
								u.aguarde(500)
								escreva("Alterando categoria. . .")
								u.aguarde(500)
								limpa()
								produtos[i][1] = "Moda Casual"
								escreva("Categoria alterada com sucesso!\n")
								
							}
							senao se (novaCatNum == "2") {
								limpa()
								produtos[i][0] = novaCatNum
								escreva("Alterando categoria.")
								u.aguarde(500)
								escreva("Alterando categoria. .")
								u.aguarde(500)
								escreva("Alterando categoria. . .")
								u.aguarde(500)
								limpa()
								produtos[i][1] = "Moda Social"
								escreva("Categoria alterada com sucesso!\n")
								
							}
							senao se (novaCatNum == "3") {
								limpa()
								produtos[i][0] = novaCatNum
								escreva("Alterando categoria.")
								u.aguarde(500)
								escreva("Alterando categoria. .")
								u.aguarde(500)
								escreva("Alterando categoria. . .")
								u.aguarde(500)
								limpa()
								produtos[i][1] = "Acessórios"
								escreva("Categoria alterada com sucesso!\n")
								
							}
							senao {
								escreva("Categoria inexistente. Por favor, tente novamente.")
								u.aguarde(2000)
								alterarProduto()
								
							}
							
							
							u.aguarde(1000)
							retornarMenuAdm ()
							pare	

							caso 2: 
							limpa()
							escreva("Digite o novo nome do produto:\n")
							leia (novoNome)
							se (novoNome == "" ou novoNome == " ") {
								escreva("Nome inválido. Por favor, tente novamente.")
								u.aguarde(1000)
								limpa()
								alterarProduto()
	
							}
							produtos[i][2] = novoNome
							limpa()
							escreva("Produto alterado com sucesso!\n")
							u.aguarde(1000)
							retornarMenuAdm ()
							pare

							caso 3:
							limpa()
							escreva("Digite a nova descrição do produto:\n")
							leia (novaDes)
							se (novaDes == "" ou novaDes == " ") {
								escreva("Descrição Inválida. Por favor, tente novamente.")
								u.aguarde(1000)
								limpa()
								alterarProduto()
	
							}
							produtos[i][3] = novaDes
							limpa()
							escreva("Descrição alterada com sucesso!\n")
							u.aguarde(1000)
							retornarMenuAdm ()
							pare

							caso 4:
							limpa()
							escreva("Digite a nova quantidade de produtos:\n")
							leia (novaQnt)
							se (novaQnt == "" ou novaQnt == " ") {
								escreva("Quantidade inválida. Por favor, tente novamente.")
								u.aguarde(1000)
								limpa()
								alterarProduto()
	
							}
							produtos[i][4] = novaQnt
							limpa()
							escreva("Quantidade alterada com sucesso!\n")
							u.aguarde(1000)
							retornarMenuAdm ()
							pare

							caso 5:
							limpa()
							escreva("Digite o novo preço do produto:\n")
							leia (novoPreco)
							se (novoPreco == "" ou novoPreco == " ") {
								escreva("Preço inválido. Por favor, tente novamente.")
								u.aguarde(1000)
								limpa()
								alterarProduto()
	
							}
							produtos[i][5] = novoPreco
							limpa()
							escreva("Preço alterado com sucesso!\n")
							u.aguarde(1000)
							retornarMenuAdm ()
							pare

							caso 6:
							limpa()
							escreva("Digite o novo valor do desconto:\n")
							leia (novoDesc)
							se (novoDesc == "" ou novoDesc == " ") {
								escreva("Nome inválido. Por favor, tente novamente.")
								u.aguarde(1000)
								limpa()
								alterarProduto()
	
							}
							produtos[i][6] = novoDesc
							limpa()
							escreva("Desconto alterado com sucesso!\n")
							u.aguarde(1000)
							retornarMenuAdm ()
							pare

							caso 7:
							limpa()
							menuAdm()
							pare
						}
					}
				}
				senao {
					escreva ("Opcao inválida, tente novamente.\n")
					u.aguarde(1000)
					limpa()				
					alterarUsuario ()
				}
			}
		}
	}

	funcao cadastrarProduto () {
		cadeia cat, nom, des, qnt, preco
		para(inteiro i=9; i<linha; i++) {
			para(inteiro j=0; j<colunaUsuario; j++) {
				se (j==0) {
					limpa()
					escreva("Categorias existentes: \n\n")
					escreva("1 - Moda Casual\n\n")
					escreva("2 - Moda Social\n\n")
					escreva("3 - Acessórios\n\n")
					escreva("Informe o número identificador da categoria: ")
					leia(cat)
					se (cat == "" ou cat == " ") {
						escreva("Valor inválido. Por favor, tente novamente.\n")
						u.aguarde(1000)
						limpa()
						cadastrarProduto()
					}
					limpa()
					se (cat == "1") {
						limpa()
						produtos[i][0] = cat
						escreva("Cadastrando categoria.")
						u.aguarde(500)
						limpa()
						escreva("Cadastrando categoria. .")
						u.aguarde(500)
						limpa()
						escreva("Cadastrando categoria. . .")
						u.aguarde(500)
						limpa()
						produtos[i][1] = "Moda Casual"
						escreva("Categoria cadastrada com sucesso!\n")
						}
					senao se (cat == "2") {
						limpa()
						produtos[i][0] = cat
						escreva("Cadastrando categoria.")
						u.aguarde(500)
						limpa()
						escreva("Cadastrando categoria. .")
						u.aguarde(500)
						limpa()
						escreva("Cadastrando categoria. . .")
						u.aguarde(500)
						limpa()
						produtos[i][1] = "Moda Social"
						escreva("Categoria cadastrada com sucesso!\n")
					}
					senao se (cat == "3") {
						limpa()
						produtos[i][0] = cat
						escreva("Cadastrando categoria.")
						u.aguarde(500)
						limpa()
						escreva("Cadastrando categoria. .")
						u.aguarde(500)
						limpa()
						escreva("Cadastrando categoria. . .")
						u.aguarde(500)
						limpa()
						produtos[i][1] = "Acessórios"
						escreva("Categoria cadastrada com sucesso!\n")
					}
					senao {
						escreva("Categoria inexistente. Por favor, tente novamente.\n")
						u.aguarde(2000)
						menuAdm()
					}
					limpa()
					escreva("Cadastre o nome do produto: ")
					leia(nom)
					se (nom == "" ou nom == " ") {
						escreva("Nome inválido. Por favor, tente novamente.")
						u.aguarde(1000)
						limpa()
						cadastrarProduto()
					}
					limpa()
					produtos[i][2] = nom
					escreva("Cadastrando nome.")
					u.aguarde(500)
					limpa()
					escreva("Cadastrando nome. .")
					u.aguarde(500)
					limpa()
					escreva("Cadastrando nome. . .")
					u.aguarde(500)
					limpa()
					escreva("Nome cadastrado com sucesso!\n")
					limpa()
					escreva("Cadastre a descrição do produto: ")
					leia(des)
					se (des == "" ou des == " ") {
						escreva("Descrição inválida. Por favor, tente novamente.")
						u.aguarde(1000)
						limpa()
						cadastrarProduto()
					}
					limpa()
					produtos[i][3] = des
					escreva("Cadastrando descrição.")
					u.aguarde(500)
					limpa()
					escreva("Cadastrando descrição. .")
					u.aguarde(500)
					limpa()
					escreva("Cadastrando descrição. . .")
					u.aguarde(500)
					limpa()
					escreva("Descriçao cadastrada com sucesso!\n")
					limpa()
					escreva("Cadastre a quantidade de produtos: ")
					leia(qnt)
					se (qnt == "" ou qnt == " ") {
						escreva("Quantidade inválida. Por favor, tente novamente.")
						u.aguarde(1000)
						limpa()
						cadastrarProduto()
					}
					limpa()
					produtos[i][4] = qnt
					escreva("Cadastrando quantidade.")
					u.aguarde(500)
					limpa()
					escreva("Cadastrando quantidade. .")
					u.aguarde(500)
					limpa()
					escreva("Cadastrando quantidade. . .")
					u.aguarde(500)
					limpa()
					escreva("Quantidade cadastrada com sucesso!\n")
					limpa()
					escreva("Cadastre o preço do produto: ")
					leia(preco)
					se (preco == "" ou preco == " ") {
						escreva("Preço inválido. Por favor, tente novamente.")
						u.aguarde(1000)
						limpa()
						cadastrarProduto()
					}
					limpa()
					produtos[i][5] = preco
					escreva("Cadastrando preço.")
					u.aguarde(500)
					limpa()
					escreva("Cadastrando preço. .")
					u.aguarde(500)
					limpa()
					escreva("Cadastrando preço. . .")
					u.aguarde(500)
					limpa()
					produtos[i][6] = "desc"
					escreva("preço cadastrado com sucesso!\n")
					limpa()
					u.aguarde(1000)
					escreva("Novo produto cadastrado com sucesso!\n")
					escreva("Gostaria de cadastrar outro usuário? [S/N]\n")
					leia(simNao)
					se (simNao == "S" ou simNao == "s") { 
					}
					senao se (simNao == "N" ou simNao == "n") {
						limpa()
						retornarMenuAdm()
						retorne
					}
						senao {
							limpa()
							escreva ("Opção invalida!\n")
							u.aguarde(1000)
							escreva ("Finalizando aplicação.\n")
							limpa()
							fim()
							retorne
						}
				}
			}
					
		}
	}
     
	funcao retornarMenuAdm () {
		limpa()
		escreva ("Retornando ao menu administrador.")
		u.aguarde(1000)
		limpa()
		escreva ("Retornando ao menu administrador. .")
		u.aguarde(1000)
		limpa()
		escreva ("Retornando ao menu administrador. . .")
		u.aguarde(1000)
		limpa()
		menuAdm()
	}

	funcao simOuNao () {
		leia (simNao)
		se (simNao == "S" ou simNao == "s") {
			limpa()
			entrada()
		}
		senao se (simNao == "N" ou simNao == "n") {
			limpa()
			fim()
		}
		senao {
			limpa()
			escreva ("Opção invalida, tente novamente\n")
			u.aguarde(1000)
			limpa()
			saudacao()
		}
	}

	funcao inexistente(){
		escreva("Opcão inexistente.")
		u.aguarde(1500)
		limpa()
		escreva("Digite uma Opção válida!")
		u.aguarde(1500)
		limpa()
	}

	funcao fim() {
		escreva("\n")
		espaco_nove()
		logo_quatro()
		espaco_cinquentatres()
		escreva("\\")
		espaco_dois()
		reta()
		espaco_dois()
		escreva("/")
		escreva("\n")
		espaco_oito()
		logo_cinco()
		espaco_cinquenta()
		escreva("\\")
		espaco_quatro()
		logo_tres()
		espaco_quatro()
		escreva("/")
		escreva("\n")
		espaco_sete()
		logo_dois()
		espaco_dois()
		logo_dois()
		espaco_cinquentatres()
		logo_sete()
		escreva("\n")
		espaco_seis()
		logo_dois()
		espaco_tres()
		logo_dois()
		espaco_quarentanove()
		travessao_dois()
		espaco_dois()
		logo_nove()
		espaco_dois()
		travessao_dois()
		escreva("\n")
		espaco_cinco()
		logo_dois()
		espaco_quatro()
		logo_dois()
		espaco_cinquentatres()
		logo_sete()
		escreva("\n")
		espaco_quatro()
		logo_dois()
		espaco_cinco()
		logo_dois()
		espaco_cinco()
		logo_dois()
		espaco_doze()
		escreva("-Até a próxima!-")
		espaco_quinze()
		escreva("/")
		espaco_quatro()
		logo_tres()
		espaco_quatro()
		escreva("\\")
		escreva("\n")
		espaco_quatro()
		logo_nove()
		espaco_cinco()
		logo_dois()
		espaco_doze()
		escreva("-A 4U agradece!-")
		espaco_dezoito()
		escreva("/")
		espaco_dois()
		reta()
		espaco_tres()
		escreva("\\")
		escreva("\n")
		espaco_quatro()
		logo_nove()
		espaco_cinco()
		logo_dois()
		escreva("\n")
		espaco_onze()
		logo_dois()
		espaco_cinco()
		logo_dois()
		escreva("\n")
		espaco_onze()
		logo_nove()
		escreva("\n")
		espaco_onze()
		logo_nove()
	}

	funcao reta(){
		para(inteiro r = 0; r < 1; r++){
			escreva("|")
		}
	}

	funcao underline_um(){
		para(inteiro u = 0; u < 1; u++){
			escreva("_")
		}
	}

	funcao underline_dois(){
		para(inteiro u = 0; u < 2; u++){
			escreva("_")
		}
	}

	funcao underline_tres(){
		para(inteiro u = 0; u < 3; u++){
			escreva("_")
		}
	}

	funcao underline_quatro(){
		para(inteiro u = 0; u < 4; u++){
			escreva("_")
		}
	}

	funcao underline_cinco(){
		para(inteiro u = 0; u < 5; u++){
			escreva("_")
		}
	}

	funcao underline_seis(){
		para(inteiro u = 0; u < 6; u++){
			escreva("_")
		}
	}

	funcao underline_sete(){
		para(inteiro u = 0; u < 7; u++){
			escreva("_")
		}
	}


	funcao underline_oito(){
		para(inteiro u = 0; u < 8; u++){
			escreva("_")
		}
	}

	funcao underline_nove(){
		para(inteiro u = 0; u < 9; u++){
			escreva("_")
		}
	}

	funcao underline_dez(){
		para(inteiro u = 0; u < 10; u++){
			escreva("_")
		}
	}

	funcao underline_quatorze(){
		para(inteiro u = 0; u < 14; u++){
			escreva("_")
		}
	}

	funcao underline_dezesseis(){
		para(inteiro u = 0; u < 16; u++){
			escreva("_")
		}
	}

	funcao underline_vinte(){
		para(inteiro u = 0; u < 20; u++){
			escreva("_")
		}
	}

	funcao underline_vinteseis(){
		para(inteiro u = 0; u < 26; u++){
			escreva("_")
		}
	}

	funcao underline_quarentatres(){
		para(inteiro u = 0; u < 43; u++){
			escreva("_")
		}
	}

	funcao espaco_um(){
		para(inteiro b = 0; b < 1; b++){
				escreva(" ")
			}
	}

	funcao espaco_dois(){
		para(inteiro b = 0; b < 2; b++){
			escreva(" ")
		}
	}

	funcao espaco_tres(){
		para(inteiro b = 0; b < 3; b++){
			escreva(" ")
		}
	}

	funcao espaco_quatro(){
		para(inteiro b = 0; b < 4; b++){
			escreva(" ")
		}
	}

	funcao espaco_cinco(){
		para(inteiro b = 0; b < 5; b++){
			escreva(" ")
		}
	}

	funcao espaco_seis(){
		para(inteiro b = 0; b < 6; b++){
			escreva(" ")
		}
	}

	funcao espaco_sete(){
		para(inteiro b = 0; b < 7; b++){
			escreva(" ")
		}
	}

	funcao espaco_oito(){
		para(inteiro b = 0; b < 8; b++){
			escreva(" ")
		}
	}

	funcao espaco_nove(){
		para(inteiro b = 0; b < 9; b++){
			escreva(" ")
		}
	}

	funcao espaco_dez(){
		para(inteiro b = 0; b < 10; b++){
			escreva(" ")
		}
	}

	funcao espaco_onze(){
		para(inteiro b = 0; b < 11; b++){
			escreva(" ")
		}
	}

	funcao espaco_doze(){
		para(inteiro b = 0; b < 12; b++){
			escreva(" ")
		}
	}

	funcao espaco_treze(){
		para(inteiro b = 0; b < 13; b++){
			escreva(" ")
		}
	}

	funcao espaco_quatorze(){
		para(inteiro b = 0; b < 14; b++){
			escreva(" ")
		}
	}

	funcao espaco_quinze(){
		para(inteiro b = 0; b < 15; b++){
			escreva(" ")
		}
	}
	
	funcao espaco_dezesseis(){
		para(inteiro b = 0; b < 16; b++){
			escreva(" ")
		}
	}

	funcao espaco_dezessete(){
		para(inteiro b = 0; b < 17; b++){
			escreva(" ")
		}
	}

	funcao espaco_dezoito(){
		para(inteiro b = 0; b < 18; b++){
			escreva(" ")
		}
	}

	funcao espaco_dezenove(){
		para(inteiro b = 0; b < 19; b++){
			escreva(" ")
		}
	}

	funcao espaco_vinteum(){
		para(inteiro b = 0; b < 21; b++){
			escreva(" ")
		}
	}
	
	funcao espaco_vintedois(){
		para(inteiro b = 0; b < 22; b++){
			escreva(" ")
		}
	}

	funcao espaco_vintetres(){
		para(inteiro b = 0; b < 23; b++){
			escreva(" ")
		}
	}

	funcao espaco_vintecinco(){
		para(inteiro b = 0; b < 25; b++){
			escreva(" ")
		}
	}

	funcao espaco_vinteseis(){
		para(inteiro b = 0; b < 26; b++){
			escreva(" ")
		}
	}

	funcao espaco_trintadois(){
		para(inteiro b = 0; b < 32; b++){
			escreva(" ")
		}
	}

	funcao espaco_trintasete(){
		para(inteiro b = 0; b < 37; b++){
			escreva(" ")
		}
	}

	funcao espaco_quarentaseis(){
		para(inteiro b = 0; b < 46; b++){
			escreva(" ")
		}
	}

	funcao espaco_quarentanove(){
		para(inteiro b = 0; b < 49; b++){
			escreva(" ")
		}
	}

	funcao espaco_cinquenta(){
		para(inteiro b = 0; b < 50; b++){
			escreva(" ")
		}
	}

	funcao espaco_cinquentatres(){
		para(inteiro b = 0; b < 53; b++){
			escreva(" ")
		}
	}

	funcao logo_dois(){
		para(inteiro i = 0; i < 2; i++){
				escreva("*")
		}
	}

	funcao logo_tres(){
		para(inteiro i = 0; i < 3; i++){
				escreva("*")
		}
	}

	funcao logo_quatro(){
		para(inteiro i = 0; i < 4; i++){
				escreva("*")
		}
	}

	funcao logo_cinco(){
		para(inteiro i = 0; i < 5; i++){
				escreva("*")
		}
	}

	funcao logo_seis(){
		para(inteiro i = 0; i < 6; i++){
				escreva("*")
		}
	}

	funcao logo_sete(){
		para(inteiro i = 0; i < 7; i++){
				escreva("*")
		}
	}

	funcao logo_oito(){
		para(inteiro i = 0; i < 7; i++){
				escreva("*")
		}
	}

	funcao logo_nove(){
		para(inteiro i = 0; i < 9; i++){
				escreva("*")
		}
	}

	funcao logo_onze(){
		para(inteiro i = 0; i < 11; i++){
				escreva("*")
		}
	}

	funcao travessao_dois(){
		para(inteiro i = 0; i < 2; i++){
				escreva("—")
		}
	}

	funcao travessao_dezesseis(){
		para(inteiro i = 0; i < 16; i++){
				escreva("—")
		}
	}

	funcao travessao_dezessete(){
		para(inteiro i = 0; i < 17; i++){
				escreva("—")
		}
	}

	funcao travessao_dezoito(){
		para(inteiro i = 0; i < 18; i++){
				escreva("—")
		}
	}

	funcao travessao_dezenove(){
		para(inteiro i = 0; i < 19; i++){
				escreva("—")
		}
	}

	funcao ecomenu(){
		escreva("\n")
		espaco_dois()
		logo_dois()
		espaco_um()
		logo_dois()
		escreva("\n")
		espaco_um()
		logo_dois()
		espaco_dois()
		logo_dois()
		espaco_dois()
		logo_dois()
		escreva("\n")
		logo_sete()
		espaco_dois()
		logo_dois()
		espaco_oito()
		escreva("╠ É um prazer ter você por aqui, ", login, "! ╣")
		escreva("\n")
		espaco_cinco()
		logo_dois()
		espaco_dois()
		logo_dois()
		escreva("\n")
		espaco_cinco()
		logo_seis()
	}

	funcao ecodezeseis(){
		escreva("\n")
		espaco_dezesseis()
		travessao_dezesseis()
		espaco_um()
		travessao_dezesseis()
		espaco_um()
		travessao_dezesseis()
		espaco_um()
	}

	funcao ecodezessete(){
		escreva("\n")
		espaco_dezessete()
		travessao_dezessete()
		espaco_um()
		travessao_dezessete()
		espaco_um()
		travessao_dezessete()
		espaco_um()
	}

	funcao ecodezoito(){
		escreva("\n")
		espaco_dezoito()
		travessao_dezoito()
		espaco_um()
		travessao_dezoito()
		espaco_um()
		travessao_dezoito()
		espaco_um()
	}

	funcao ecodezenove(){
		escreva("\n")
		espaco_dezenove()
		travessao_dezenove()
		espaco_um()
		travessao_dezenove()
		espaco_um()
		travessao_dezenove()
		espaco_um()
	}

	funcao ecoCheck(){
		espaco_sete()
		travessao_dezesseis()
		espaco_um()
		travessao_dezesseis()
		espaco_um()
		travessao_dezesseis()
		escreva("\n")
	}

	funcao mangaesquerda(){
		escreva("/")
		espaco_dois()
		escreva("/")
	}

	funcao mangadireita(){
		escreva("\\")
		espaco_dois()
		escreva("\\")
	}
	funcao meiocamisa(){
		reta()
		espaco_oito()
		reta()
	}

	funcao meiosembotao(){
		reta()
		espaco_tres()
		escreva("\\/")
		espaco_tres()
		reta()
	}
	
	funcao meiocombotao(){
		reta()
		espaco_tres()
		escreva("\\/°")
		espaco_dois()
		reta()
	}

	funcao barracalca(){
		escreva("\n")
		espaco_oito()
		reta()
		espaco_dois()
		reta()
		espaco_dois()
		reta()
		espaco_dois()
		reta()
	}

	funcao meiocasaco(){
		reta()
		espaco_sete()
		reta()
	}

	funcao pulameio(){
		escreva("\n")
		espaco_oito()
		reta()
		espaco_oito()
		reta()
	}

	funcao espacoBolsa(){
		escreva("\n")
		reta()
		espaco_vinteseis()
		reta()
	}

	funcao espacoCheck(){
		espaco_oito()
		reta()
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 16907; 
 * @DOBRAMENTO-CODIGO = [35, 39, 130, 239, 267, 343, 420, 493, 577, 649, 919, 984, 1035, 1122, 1192, 1247, 1349, 1395, 1439, 1543, 1562, 1583, 1601, 1651];
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 30854; 
 * @DOBRAMENTO-CODIGO = [39, 130, 239, 267, 343, 420, 493, 577, 649, 788, 919, 1034, 987, 1041, 1131, 1204, 1262, 1367, 1416, 1463, 1590, 1614, 1632, 1682, 1791, 1917, 1982, 2036, 2158, 2211, 2284, 2483, 2664, 2678, 2697, 2706, 2796];
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */
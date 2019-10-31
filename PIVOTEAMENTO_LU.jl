println("Decomposição LU") 
R = [2.0 1 1 0; 4 3 3 1; 8 7 9 5; 6 7 9 8]
n,m = size(R) 
#Checagem de matriz
if m!=n 
	error("Matriz incompatível") 
end 

#Criando matrizes identidade L e P que serão modificadas
L=zeros(n,n) 
P=zeros(n,n) 
for a= 1:n 
	L[a,a] = 1 
	P[a,a] = 1 
end 
nP = 0 

function matrizlu!(A) 
	global U=R 
	#decomposição 
	for k=1:n-1 #iteração dos pivôs 
		pivo = U[k,k] 
		
		for h = k+1:n 
			#condicional para seleção do pivô e troca de linhas 
			if abs(U[k,k]) >=abs(U[h,k])
				pivo = U[k,k] 
			else 
				global nP = nP+1 
				V= U[k,:] 
				U[k,:] = U[h,:] 
				U[h,:] = V 
				X = P[k, :] 
				P[k,:] = P[h,:] 
				P[H,:] = X 
				pivo = U[k,k] 
			end 
		end 
		for i = k+1:n #iteração nas linhas por baixo do pivô
			m = U[i,k]*pivo^(-1)  
			L[i,k] = m 
			for j= 1:n #eliminação na matriz de coeficientes 
				U[i,j] = U[i,j] - m*U[k, j] 
			end 
		end 
	end 
	return nP 
end 

matrizlu!(R) 
println("A matriz L é:",L) 
println("A matriz U é:",U)
println("A matriz P é",P) 
println("O número de permutações é",nP) 
 
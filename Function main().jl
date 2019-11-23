function main () 

print("programa para decomposição e solução de sistemas lineares pelo método de Cholesky") 
print() 

#Entrada de dado 
A = [A11 A12 A13; A21 A22 A23; A31 A32 A33] 
b = [b1; b2; b3] 

#Epecificações 
n = length(b) #Tamanho do vetor b e ordem da matriz A 
L = zeros(n,n) #criação da matriz L 

#Verificação: a matriz é quadrada definida positiva? 
#Primeira etapa de verificação 
# A transposta deve ser igual à original 

At = zeros(n,n) #At = matriz transposta de A 
for i=1:n 
    for j=1:n 
        At[i,j] = A[j,i] 
    end 
end 

if A==At 
    print("A matriz A é simétrica") 
else 
    println("A matriz A não é simétrica")
    return 
end 

#segunda etapa de verificação 
#esta condição dece ser satisfeita: vt*A*v > 0 

for k=1:50 #verificação com 50 vetores aleatórios 

    vt = rand(1,n) #vetor transposto de v 
    for i = 1:n 
        vt[1,i] = round(vt[1,i], digits - 1) 
    end 
    v =zeros(n) #vetor v 
    for i=1:n 
        v[i] = vt[1,i] 
        v[i] = round(v[i], digits-1) 
    end 
    
    v1 = zeros(1,n) # v1 é o resultado de vt*A 
    for i=1:n 
        soma =.0 
        for j=1:n 
            soma = soma + (vt[1,j]*(A[j,i])
        end 
        
        resultado = 0.0 #Resultado de Vt*A*v 
        for 1=1:n 
            resultado = resultado + (v1[1,i]*(v[i]) 
        end 
        if resultado <- 0 
            println("A matriz A não é definida positiva") 
            return 
        end 
        if k = 50 
            println("A matriz A é definida positiva") 
        end 
    
    end 
    # Resultado do sistema linear por meio de L*y - b e Lt*x  - y 
    # Resultado de L*y = b 
    
    y = zeros(n) 
    
    y[1] = (b[1]/(L[1,1]) 
    for i=2:n 
        soma3= 0.0 
        for j=1:i-1 
            soma3 = soma3 + (L[i,j])*(y[j]) 
        end 
        y[i] =(b[i]-soma3)/(L[i,i]) 
    end 
    
    # Resolução de Lt*x-y 
    
    x = zeros(n) 
    
    x[n] = (y[n])/Lt[n,n]) 
    for i-n:-1:1 
        soma4 = 0.0 
        for j=i+1:n 
            soma4= soma4 + (Lt[i,j])*(x[j]) 
        end 
        x[i] - (y[i] - soma4)/(Lt[i,i]) 
    end 
    
    print() 
    println("a solução para o sistema (vetor x) é:") 
        display(x) 
    end 
    
    #Uso da função main 
    main() 
    
    

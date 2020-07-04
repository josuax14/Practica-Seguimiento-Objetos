function salida = FiltrarPuntosImagen(matrizImagen,Centroide,Radio)

R = matrizImagen(:,:,1)
G = matrizImagen(:,:,2)
B = matrizImagen(:,:,3)

PosColor = zeros(size(R))

[filas columnas] = size(R)

R = double (R);
G = double (G);
B = double (B);

for y = 1 : filas
    for x = 1 : columnas
        
        if(sqrt((((Centroide(1) - R(y,x))^ 2) + ((Centroide(2) - G(y,x))^ 2) + ((Centroide(3) - B(y,x))^ 2))) < Radio);
        
            PosColor(y,x) = 1;            
        end        
    end
end

R = uint8 (R);
G = uint8 (G);
B = uint8 (B);

R(PosColor == 1) = 0;
G(PosColor == 1) = 255;
B(PosColor == 1) = 255;

salida = cat(3,R,G,B);
end
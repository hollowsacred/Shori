PGDMP                         {            Shori    15.1    15.1 O    ]           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            ^           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            _           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            `           1262    16398    Shori    DATABASE     {   CREATE DATABASE "Shori" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
    DROP DATABASE "Shori";
                postgres    false            �            1259    16449    Basket    TABLE     P   CREATE TABLE public."Basket" (
    id integer NOT NULL,
    "userId" integer
);
    DROP TABLE public."Basket";
       public         heap    postgres    false            �            1259    16456    BasketProduct    TABLE     �   CREATE TABLE public."BasketProduct" (
    id integer NOT NULL,
    "basketId" integer,
    "productId" integer,
    count integer DEFAULT 1 NOT NULL
);
 #   DROP TABLE public."BasketProduct";
       public         heap    postgres    false            �            1259    16455    BasketProduct_id_seq    SEQUENCE     �   CREATE SEQUENCE public."BasketProduct_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public."BasketProduct_id_seq";
       public          postgres    false    226            a           0    0    BasketProduct_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public."BasketProduct_id_seq" OWNED BY public."BasketProduct".id;
          public          postgres    false    225            �            1259    16448    Basket_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Basket_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public."Basket_id_seq";
       public          postgres    false    224            b           0    0    Basket_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public."Basket_id_seq" OWNED BY public."Basket".id;
          public          postgres    false    223            �            1259    16440    Category    TABLE     T   CREATE TABLE public."Category" (
    id integer NOT NULL,
    name text NOT NULL
);
    DROP TABLE public."Category";
       public         heap    postgres    false            �            1259    16439    Category_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Category_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public."Category_id_seq";
       public          postgres    false    222            c           0    0    Category_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public."Category_id_seq" OWNED BY public."Category".id;
          public          postgres    false    221            �            1259    20188    Comments    TABLE     �   CREATE TABLE public."Comments" (
    id integer NOT NULL,
    date timestamp(3) without time zone NOT NULL,
    description text NOT NULL,
    likes integer NOT NULL,
    "userId" integer,
    "productId" integer
);
    DROP TABLE public."Comments";
       public         heap    postgres    false            �            1259    20187    Comments_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Comments_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public."Comments_id_seq";
       public          postgres    false    228            d           0    0    Comments_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public."Comments_id_seq" OWNED BY public."Comments".id;
          public          postgres    false    227            �            1259    23825    Order    TABLE     �   CREATE TABLE public."Order" (
    id integer NOT NULL,
    "datePurchase" timestamp(3) without time zone NOT NULL,
    "dateDelivery" timestamp(3) without time zone,
    "userId" integer NOT NULL,
    "pickpointId" integer,
    cost integer NOT NULL
);
    DROP TABLE public."Order";
       public         heap    postgres    false            �            1259    23824    Order_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Order_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public."Order_id_seq";
       public          postgres    false    232            e           0    0    Order_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public."Order_id_seq" OWNED BY public."Order".id;
          public          postgres    false    231            �            1259    21406 	   PickPoint    TABLE     �   CREATE TABLE public."PickPoint" (
    id integer NOT NULL,
    index text NOT NULL,
    city text NOT NULL,
    street text NOT NULL,
    "streetNumber" text NOT NULL,
    longitude text NOT NULL,
    latitude text NOT NULL
);
    DROP TABLE public."PickPoint";
       public         heap    postgres    false            �            1259    21405    PickPoint_id_seq    SEQUENCE     �   CREATE SEQUENCE public."PickPoint_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public."PickPoint_id_seq";
       public          postgres    false    230            f           0    0    PickPoint_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public."PickPoint_id_seq" OWNED BY public."PickPoint".id;
          public          postgres    false    229            �            1259    16431    Product    TABLE     �   CREATE TABLE public."Product" (
    id integer NOT NULL,
    title text NOT NULL,
    price integer NOT NULL,
    "oldPrice" integer,
    count integer NOT NULL,
    img text NOT NULL,
    "categoryId" integer,
    belongs text,
    description text
);
    DROP TABLE public."Product";
       public         heap    postgres    false            �            1259    16430    Product_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Product_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public."Product_id_seq";
       public          postgres    false    220            g           0    0    Product_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public."Product_id_seq" OWNED BY public."Product".id;
          public          postgres    false    219            �            1259    16422    Role    TABLE     P   CREATE TABLE public."Role" (
    id integer NOT NULL,
    name text NOT NULL
);
    DROP TABLE public."Role";
       public         heap    postgres    false            �            1259    16421    Role_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Role_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public."Role_id_seq";
       public          postgres    false    218            h           0    0    Role_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public."Role_id_seq" OWNED BY public."Role".id;
          public          postgres    false    217            �            1259    16413    User    TABLE     �   CREATE TABLE public."User" (
    id integer NOT NULL,
    login text NOT NULL,
    password text NOT NULL,
    email text NOT NULL,
    "roleId" integer,
    gender text,
    name text,
    phone text
);
    DROP TABLE public."User";
       public         heap    postgres    false            �            1259    16412    User_id_seq    SEQUENCE     �   CREATE SEQUENCE public."User_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public."User_id_seq";
       public          postgres    false    216            i           0    0    User_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public."User_id_seq" OWNED BY public."User".id;
          public          postgres    false    215            �            1259    16401    _prisma_migrations    TABLE     �  CREATE TABLE public._prisma_migrations (
    id character varying(36) NOT NULL,
    checksum character varying(64) NOT NULL,
    finished_at timestamp with time zone,
    migration_name character varying(255) NOT NULL,
    logs text,
    rolled_back_at timestamp with time zone,
    started_at timestamp with time zone DEFAULT now() NOT NULL,
    applied_steps_count integer DEFAULT 0 NOT NULL
);
 &   DROP TABLE public._prisma_migrations;
       public         heap    postgres    false            �           2604    16452 	   Basket id    DEFAULT     j   ALTER TABLE ONLY public."Basket" ALTER COLUMN id SET DEFAULT nextval('public."Basket_id_seq"'::regclass);
 :   ALTER TABLE public."Basket" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    223    224    224            �           2604    16459    BasketProduct id    DEFAULT     x   ALTER TABLE ONLY public."BasketProduct" ALTER COLUMN id SET DEFAULT nextval('public."BasketProduct_id_seq"'::regclass);
 A   ALTER TABLE public."BasketProduct" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    226    225    226            �           2604    16443    Category id    DEFAULT     n   ALTER TABLE ONLY public."Category" ALTER COLUMN id SET DEFAULT nextval('public."Category_id_seq"'::regclass);
 <   ALTER TABLE public."Category" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    221    222    222            �           2604    20191    Comments id    DEFAULT     n   ALTER TABLE ONLY public."Comments" ALTER COLUMN id SET DEFAULT nextval('public."Comments_id_seq"'::regclass);
 <   ALTER TABLE public."Comments" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    228    227    228            �           2604    23828    Order id    DEFAULT     h   ALTER TABLE ONLY public."Order" ALTER COLUMN id SET DEFAULT nextval('public."Order_id_seq"'::regclass);
 9   ALTER TABLE public."Order" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    231    232    232            �           2604    21409    PickPoint id    DEFAULT     p   ALTER TABLE ONLY public."PickPoint" ALTER COLUMN id SET DEFAULT nextval('public."PickPoint_id_seq"'::regclass);
 =   ALTER TABLE public."PickPoint" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    230    229    230            �           2604    16434 
   Product id    DEFAULT     l   ALTER TABLE ONLY public."Product" ALTER COLUMN id SET DEFAULT nextval('public."Product_id_seq"'::regclass);
 ;   ALTER TABLE public."Product" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    219    220            �           2604    16425    Role id    DEFAULT     f   ALTER TABLE ONLY public."Role" ALTER COLUMN id SET DEFAULT nextval('public."Role_id_seq"'::regclass);
 8   ALTER TABLE public."Role" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    217    218            �           2604    16416    User id    DEFAULT     f   ALTER TABLE ONLY public."User" ALTER COLUMN id SET DEFAULT nextval('public."User_id_seq"'::regclass);
 8   ALTER TABLE public."User" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    215    216            R          0    16449    Basket 
   TABLE DATA           0   COPY public."Basket" (id, "userId") FROM stdin;
    public          postgres    false    224   �Z       T          0    16456    BasketProduct 
   TABLE DATA           M   COPY public."BasketProduct" (id, "basketId", "productId", count) FROM stdin;
    public          postgres    false    226   �Z       P          0    16440    Category 
   TABLE DATA           .   COPY public."Category" (id, name) FROM stdin;
    public          postgres    false    222   [       V          0    20188    Comments 
   TABLE DATA           Y   COPY public."Comments" (id, date, description, likes, "userId", "productId") FROM stdin;
    public          postgres    false    228   �[       Z          0    23825    Order 
   TABLE DATA           d   COPY public."Order" (id, "datePurchase", "dateDelivery", "userId", "pickpointId", cost) FROM stdin;
    public          postgres    false    232   G\       X          0    21406 	   PickPoint 
   TABLE DATA           c   COPY public."PickPoint" (id, index, city, street, "streetNumber", longitude, latitude) FROM stdin;
    public          postgres    false    230   �\       N          0    16431    Product 
   TABLE DATA           q   COPY public."Product" (id, title, price, "oldPrice", count, img, "categoryId", belongs, description) FROM stdin;
    public          postgres    false    220   �]       L          0    16422    Role 
   TABLE DATA           *   COPY public."Role" (id, name) FROM stdin;
    public          postgres    false    218   �`       J          0    16413    User 
   TABLE DATA           [   COPY public."User" (id, login, password, email, "roleId", gender, name, phone) FROM stdin;
    public          postgres    false    216   a       H          0    16401    _prisma_migrations 
   TABLE DATA           �   COPY public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
    public          postgres    false    214   jb       j           0    0    BasketProduct_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public."BasketProduct_id_seq"', 617, true);
          public          postgres    false    225            k           0    0    Basket_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public."Basket_id_seq"', 18, true);
          public          postgres    false    223            l           0    0    Category_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public."Category_id_seq"', 22, true);
          public          postgres    false    221            m           0    0    Comments_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public."Comments_id_seq"', 21, true);
          public          postgres    false    227            n           0    0    Order_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public."Order_id_seq"', 9, true);
          public          postgres    false    231            o           0    0    PickPoint_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public."PickPoint_id_seq"', 4, true);
          public          postgres    false    229            p           0    0    Product_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public."Product_id_seq"', 94, true);
          public          postgres    false    219            q           0    0    Role_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public."Role_id_seq"', 3, true);
          public          postgres    false    217            r           0    0    User_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public."User_id_seq"', 23, true);
          public          postgres    false    215            �           2606    16461     BasketProduct BasketProduct_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public."BasketProduct"
    ADD CONSTRAINT "BasketProduct_pkey" PRIMARY KEY (id);
 N   ALTER TABLE ONLY public."BasketProduct" DROP CONSTRAINT "BasketProduct_pkey";
       public            postgres    false    226            �           2606    16454    Basket Basket_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public."Basket"
    ADD CONSTRAINT "Basket_pkey" PRIMARY KEY (id);
 @   ALTER TABLE ONLY public."Basket" DROP CONSTRAINT "Basket_pkey";
       public            postgres    false    224            �           2606    16447    Category Category_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public."Category"
    ADD CONSTRAINT "Category_pkey" PRIMARY KEY (id);
 D   ALTER TABLE ONLY public."Category" DROP CONSTRAINT "Category_pkey";
       public            postgres    false    222            �           2606    20195    Comments Comments_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public."Comments"
    ADD CONSTRAINT "Comments_pkey" PRIMARY KEY (id);
 D   ALTER TABLE ONLY public."Comments" DROP CONSTRAINT "Comments_pkey";
       public            postgres    false    228            �           2606    23830    Order Order_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public."Order"
    ADD CONSTRAINT "Order_pkey" PRIMARY KEY (id);
 >   ALTER TABLE ONLY public."Order" DROP CONSTRAINT "Order_pkey";
       public            postgres    false    232            �           2606    21413    PickPoint PickPoint_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public."PickPoint"
    ADD CONSTRAINT "PickPoint_pkey" PRIMARY KEY (id);
 F   ALTER TABLE ONLY public."PickPoint" DROP CONSTRAINT "PickPoint_pkey";
       public            postgres    false    230            �           2606    16438    Product Product_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public."Product"
    ADD CONSTRAINT "Product_pkey" PRIMARY KEY (id);
 B   ALTER TABLE ONLY public."Product" DROP CONSTRAINT "Product_pkey";
       public            postgres    false    220            �           2606    16429    Role Role_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public."Role"
    ADD CONSTRAINT "Role_pkey" PRIMARY KEY (id);
 <   ALTER TABLE ONLY public."Role" DROP CONSTRAINT "Role_pkey";
       public            postgres    false    218            �           2606    16420    User User_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_pkey" PRIMARY KEY (id);
 <   ALTER TABLE ONLY public."User" DROP CONSTRAINT "User_pkey";
       public            postgres    false    216            �           2606    16409 *   _prisma_migrations _prisma_migrations_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public._prisma_migrations
    ADD CONSTRAINT _prisma_migrations_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public._prisma_migrations DROP CONSTRAINT _prisma_migrations_pkey;
       public            postgres    false    214            �           1259    16462    Basket_userId_key    INDEX     S   CREATE UNIQUE INDEX "Basket_userId_key" ON public."Basket" USING btree ("userId");
 '   DROP INDEX public."Basket_userId_key";
       public            postgres    false    224            �           2606    16484 )   BasketProduct BasketProduct_basketId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."BasketProduct"
    ADD CONSTRAINT "BasketProduct_basketId_fkey" FOREIGN KEY ("basketId") REFERENCES public."Basket"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 W   ALTER TABLE ONLY public."BasketProduct" DROP CONSTRAINT "BasketProduct_basketId_fkey";
       public          postgres    false    224    3240    226            �           2606    16479 *   BasketProduct BasketProduct_productId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."BasketProduct"
    ADD CONSTRAINT "BasketProduct_productId_fkey" FOREIGN KEY ("productId") REFERENCES public."Product"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 X   ALTER TABLE ONLY public."BasketProduct" DROP CONSTRAINT "BasketProduct_productId_fkey";
       public          postgres    false    220    3236    226            �           2606    16474    Basket Basket_userId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Basket"
    ADD CONSTRAINT "Basket_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 G   ALTER TABLE ONLY public."Basket" DROP CONSTRAINT "Basket_userId_fkey";
       public          postgres    false    224    3232    216            �           2606    20201     Comments Comments_productId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Comments"
    ADD CONSTRAINT "Comments_productId_fkey" FOREIGN KEY ("productId") REFERENCES public."Product"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 N   ALTER TABLE ONLY public."Comments" DROP CONSTRAINT "Comments_productId_fkey";
       public          postgres    false    220    228    3236            �           2606    20196    Comments Comments_userId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Comments"
    ADD CONSTRAINT "Comments_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 K   ALTER TABLE ONLY public."Comments" DROP CONSTRAINT "Comments_userId_fkey";
       public          postgres    false    228    3232    216            �           2606    23831    Order Order_pickpointId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Order"
    ADD CONSTRAINT "Order_pickpointId_fkey" FOREIGN KEY ("pickpointId") REFERENCES public."PickPoint"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 J   ALTER TABLE ONLY public."Order" DROP CONSTRAINT "Order_pickpointId_fkey";
       public          postgres    false    230    232    3247            �           2606    17430    Product Product_categoryId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Product"
    ADD CONSTRAINT "Product_categoryId_fkey" FOREIGN KEY ("categoryId") REFERENCES public."Category"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 M   ALTER TABLE ONLY public."Product" DROP CONSTRAINT "Product_categoryId_fkey";
       public          postgres    false    3238    220    222            �           2606    17425    User User_roleId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_roleId_fkey" FOREIGN KEY ("roleId") REFERENCES public."Role"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 C   ALTER TABLE ONLY public."User" DROP CONSTRAINT "User_roleId_fkey";
       public          postgres    false    218    3234    216            R   6   x��A�0��L��c'(� �qt7
�bi�jF�e�n�ţ������Y�      T      x������ � �      P   �   x�-�M� ��p�N��ۻ�ƶDmU����$]��poTOr-�4�;l=T��"�����%q$�����L�	\52��pƢ44�5��� �3����	?J�U�QL!�S՛n���`v��m�-Ak��RJ���>��!��@G      V   z   x�eͱ! ��L� c�0K��hR��*R�4����2��B��s��Z�F�\��^����{�6v	�S܊�����u��O�'��$`����52���~L]��Y_ߤ���a\8t      Z   �   x�]λ�0 �Z����_$����8��D���x����!���Ns\�Ⴧ�8Ȧ�Z	%�Q���L����؟�lN�ߔo��1GNy�L
�M�RZ�R��h��0�c*���<Z�s��C�6fq��b])�\ omt=      X   �   x�%�MN1F��)8Ad;�w�0�i�mٰAlHl��Fm�����(ǖ���PI��Mu�Qg��z��Wg�ol덋�@r���A�X�3��-�}��a'�@�}��˳��u���:��Bα�ʐj,,�9Hl+�Gg��A�]�SA_]g�����z[�Mv��;�� 2��+r$b���v]���Nn2�c1m�L<Ye�������K!�߄��      N     x��U�n�@}��~	�x������i�,MJ�[ӨT�H��U�kp������?�̸NB����6���{�2\��<�<5dW�TL�G��S�7�,�@��8�w|۷m�J=n۝��,Տv͖�[lע�n\oV�f�]��o�b�V�:qi�Vl���b�����N��GU��F�$��ɋ�d'y���\�E
K[��v?���h砵G��}�q��#h� T�	�$b@���q�u�G(� %���,�Q|�������69���wl�5k���i<��/e`��!q#{ ������M���v��B���C�+
��7f).GKtc]oq����E0��![�{�ЁNN8ԉ�u�H7y}�=n)�_���j�!X�Gևh���'�r sd"E/�.�,�H��!����ԇf��k^���`zƑ�j��b,��bX�MuZP�q?�=�h�� �03�ծ/����R16���͖���C�_�u�R�ʝ|�k9�'��2���������\0����=�9R� �9�a9�5�U6�P��q���, ��X�dA9\�]c/��;�b(O��#dƽ�2����`a+g^�Ռ|cw�
�]Eo;�%<��Tm#*�C<v���I|^\���j�'XR�6��gt �U��v�9�ڴ�2Y�d2�6kRw;_oA�Zr�a<|:��ͦ��]��� fY��?�OI^�lVn�	��f����[�����u�$j���A|z�vҫ�h��0؉��վ�3<�5����W;���)���      L   $   x�3�LL����2�,-N-�2��M�KL�b���� ��      J   <  x�}��N�@����4�"7��O��������Z�&��L�x4A�����0�F�Y�b����of��t2 !MG�?<띤1H��������7x}CB6	�w�.r�_$^a�f�p鏳 
�*�Uf�f�3��iB�*j�"^յ�b��Gp�|�#t�?�'nԔ�.g&�us?���պ��Qg{��z6��"��<��ȏhD��q5�I�TiI>r\cQ�Մ#��1��Ԧ��W��w���a�QN.��}�މ��|6�!a��ӳ���~�w��)}��潖�d����A��±liٶ4��a[�A�r      H   �  x�mVYNdG��ZE��^�qs^��T��T���w��L� �C<΍{��;�b�J����l!�6�Z��꩷�Z��"}�9TS*eZRS.�k�,�m�F�W�\��5[�V9�n��w�����Q��?��~J.�N�r��4���������/�&����-1�͉�f���E�R�6+�~���,m��f[Rit�L:���w�9�X!U�י
���eG!�O���N���=]'VNF��������sj�)���ln���n�4���6�<�јFv(���h��w��ifrf�+S�U���d̢-UQ�^���
���o���˙�����)/�[�Y<�V��f��Nc��R��j�z�;*vL�Y]<b	%��	���X�Ǫ]+Fu�ZJ�>�P��x=1����[��^������C��n/�y�s�;�7�%���gj��y`Of��p�y���%l��]=f�T�Q-Ym�:��b࣑ߘ�;s�O����c��ce錹�8�?�����'}"�VSu:n �_ej�����& ��7Ȣ`+X��V$����a����=F��F��!>^���@`����������E����*^�c�N�&����Euk�`Q.�ђ(�k"y�0�1�\c�(ԇ��ef3�k�̥�ڴW�Vt$���
�����$r����k�g9?ϧ�O��9h���e�m���lP�E�=-P��Ì�u��޸{#Z�E,��� ௥5����:��R`��j7(��8Q:���|�_L��?����%JW9�ᦰ�mq�` �r�*�)$y ��,�.iӛ���,�R����/ժMR%���=��l߉v?q?z���F���:��E|>�å�̰�fzl0���2�b6�rk��I*=*;�Vՙ`Hs���M�P|1�k�1X�=Tl��\b�ݤG��t ���~B0I������?���~O������Y�W�U�B4�N6#n��ٱ$�X;��_m�d�a��U�Vɾր&9!��,ۙ6�"W�N2�5F������A�&�K����Q0S��˹����A	��+�r�	�m�m�e��LYӦxZA|�u/z	�ke8�!m��0� ?�4�#��pEf�_�k�Nu�'*G�)e%Be*��@�?��w�O74�=��{%=aW�����;JІ@JH��a��<ڇ%��-	}��:����p��]�"�a�ўF�u�7d�M3�
�����A����n�>���������x��ռ=��W� 6iE��>����l�h k��B��.�j�`Բ������݋CA��w6�~��Z���y�T�I(�L���m)�%)���<�S�<<_��>����^�-p��^�o�0xV{њӘ�> �J^�g-�B�T�(�ax��rY{�K+"�*�J�54����=�5�mN�6�n/}�&�����=�_�>�ػG��8�^� 8�+6�p����vͭ�T��z����zϲ��#��b[d�N泅��WG-8��(�-$q��vdA޻����O�zw, �:��K5m����6d�쑈��	�b��kL�`_���PR��B2�S�J-�Q�	n�īcO�E>I	��a���:�����r���s�	��/s�~����?q�,�     
PGDMP                         z            Shori    15.1    15.1 7    <           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            =           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            >           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            ?           1262    16398    Shori    DATABASE     {   CREATE DATABASE "Shori" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
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
       public          postgres    false    226            @           0    0    BasketProduct_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public."BasketProduct_id_seq" OWNED BY public."BasketProduct".id;
          public          postgres    false    225            �            1259    16448    Basket_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Basket_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public."Basket_id_seq";
       public          postgres    false    224            A           0    0    Basket_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public."Basket_id_seq" OWNED BY public."Basket".id;
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
       public          postgres    false    222            B           0    0    Category_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public."Category_id_seq" OWNED BY public."Category".id;
          public          postgres    false    221            �            1259    16431    Product    TABLE     �   CREATE TABLE public."Product" (
    id integer NOT NULL,
    title text NOT NULL,
    price integer NOT NULL,
    "oldPrice" integer NOT NULL,
    count integer NOT NULL,
    img text NOT NULL,
    "categoryId" integer,
    belongs text
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
       public          postgres    false    220            C           0    0    Product_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public."Product_id_seq" OWNED BY public."Product".id;
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
       public          postgres    false    218            D           0    0    Role_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public."Role_id_seq" OWNED BY public."Role".id;
          public          postgres    false    217            �            1259    16413    User    TABLE     �   CREATE TABLE public."User" (
    id integer NOT NULL,
    login text NOT NULL,
    password text NOT NULL,
    email text NOT NULL,
    "roleId" integer
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
       public          postgres    false    216            E           0    0    User_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public."User_id_seq" OWNED BY public."User".id;
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
       public          postgres    false    222    221    222            �           2604    16434 
   Product id    DEFAULT     l   ALTER TABLE ONLY public."Product" ALTER COLUMN id SET DEFAULT nextval('public."Product_id_seq"'::regclass);
 ;   ALTER TABLE public."Product" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    220    220            �           2604    16425    Role id    DEFAULT     f   ALTER TABLE ONLY public."Role" ALTER COLUMN id SET DEFAULT nextval('public."Role_id_seq"'::regclass);
 8   ALTER TABLE public."Role" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    218    218            �           2604    16416    User id    DEFAULT     f   ALTER TABLE ONLY public."User" ALTER COLUMN id SET DEFAULT nextval('public."User_id_seq"'::regclass);
 8   ALTER TABLE public."User" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    215    216            7          0    16449    Basket 
   TABLE DATA           0   COPY public."Basket" (id, "userId") FROM stdin;
    public          postgres    false    224   �=       9          0    16456    BasketProduct 
   TABLE DATA           M   COPY public."BasketProduct" (id, "basketId", "productId", count) FROM stdin;
    public          postgres    false    226   �=       5          0    16440    Category 
   TABLE DATA           .   COPY public."Category" (id, name) FROM stdin;
    public          postgres    false    222   �=       3          0    16431    Product 
   TABLE DATA           d   COPY public."Product" (id, title, price, "oldPrice", count, img, "categoryId", belongs) FROM stdin;
    public          postgres    false    220   �>       1          0    16422    Role 
   TABLE DATA           *   COPY public."Role" (id, name) FROM stdin;
    public          postgres    false    218   @       /          0    16413    User 
   TABLE DATA           F   COPY public."User" (id, login, password, email, "roleId") FROM stdin;
    public          postgres    false    216   O@       -          0    16401    _prisma_migrations 
   TABLE DATA           �   COPY public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
    public          postgres    false    214   �@       F           0    0    BasketProduct_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public."BasketProduct_id_seq"', 370, true);
          public          postgres    false    225            G           0    0    Basket_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public."Basket_id_seq"', 6, true);
          public          postgres    false    223            H           0    0    Category_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public."Category_id_seq"', 22, true);
          public          postgres    false    221            I           0    0    Product_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public."Product_id_seq"', 76, true);
          public          postgres    false    219            J           0    0    Role_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public."Role_id_seq"', 3, true);
          public          postgres    false    217            K           0    0    User_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public."User_id_seq"', 6, true);
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
       public            postgres    false    222            �           2606    16438    Product Product_pkey 
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
       public          postgres    false    224    3222    226            �           2606    16479 *   BasketProduct BasketProduct_productId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."BasketProduct"
    ADD CONSTRAINT "BasketProduct_productId_fkey" FOREIGN KEY ("productId") REFERENCES public."Product"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 X   ALTER TABLE ONLY public."BasketProduct" DROP CONSTRAINT "BasketProduct_productId_fkey";
       public          postgres    false    226    3218    220            �           2606    16474    Basket Basket_userId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Basket"
    ADD CONSTRAINT "Basket_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 G   ALTER TABLE ONLY public."Basket" DROP CONSTRAINT "Basket_userId_fkey";
       public          postgres    false    3214    216    224            �           2606    17430    Product Product_categoryId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Product"
    ADD CONSTRAINT "Product_categoryId_fkey" FOREIGN KEY ("categoryId") REFERENCES public."Category"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 M   ALTER TABLE ONLY public."Product" DROP CONSTRAINT "Product_categoryId_fkey";
       public          postgres    false    220    3220    222            �           2606    17425    User User_roleId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_roleId_fkey" FOREIGN KEY ("roleId") REFERENCES public."Role"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 C   ALTER TABLE ONLY public."User" DROP CONSTRAINT "User_roleId_fkey";
       public          postgres    false    218    216    3216            7   %   x�3�4�2�4�2�4�2�4�2�4�2�4����� 5Q�      9      x������ � �      5   �   x�-�M� ��p�N��ۻ�ƶDmU����$]��poTOr-�4�;l=T��"�����%q$�����L�	\52��pƢ44�5��� �3����	?J�U�QL!�S՛n���`v��m�-Ak��RJ���>��!��@G      3   o  x����J�@�ϓ���M��پ��b�ږ6"�צ��x��^�Z�Hi�}��7r61����f���� >a�����_�������~�"!�&��<Izø5���Iw�E��>��evq�@7�j�k�`AȡJ����A��@������{��;wh ���p��laء�1�lۥ�R�ZC�/�BK��>/[N���}G��~Gw9@]���$G�_i^�K������4~pIl��/���.�p�X����8��L���v��T!�)idG����SjUE��!�-hƿ,1��^?�{���8�*���q��ű�b������D	9K5�v�9��=��R�^�F�D�!=my��
2�\      1   $   x�3�LL����2�,-N-�2��M�KL�b���� ��      /   k   x�U��
� ���&P+�փt)dF꡷�$Hw���m�@�B*�v�1[��ޭ�A�D
��[%)�|&mMy.��=l2!bj���� �۬_�,�Fh�ͳ�/=�6:      -     x�m�[�#7E�ݫ��@�DzY� =����;p� �+vfڎ��1,��%�u@P�$ 5eՑ���,s�J(��v&�x_�`�
�2 �F���eԸI�2���z  J��2��j�R~��_$d,���������yV�Y�Խ_r͒�zaN��%�Zt�0=C>(��e�����՗xA��*����KF$�gZJ�jb'��~��=�҆O��+��tE�#�J�N���+��L͡*�5�۩PB�@�EPM|f0*������6ۜM�����7�O'��J��w������Eo�W�:z+-�>�8<�4���V}��Bqi���4����U��Wk�� s6�ԑ{G͓�=R�	 f��}@�n�������/�y>Wq�gc�� <`f�������
*�L3r'�3��m��^MaLZ��5gnk�b��S�<cW�%|��/���z=s5���1Z%�>���ֿ+�Vn����RŶR�Ђ|A�s�%���.mO��8���Z@�K�7���������P"C>J�waa;A9�#�;��e�������g"~����U��.�«=E�!�wI����aX0L�}l���ȁ;��Hl�����£F"��96�4��o��6Q�+`�po%�U��""�t������z�l����/�����Hv�5G�y$5ה{$�GZ(lk��c��M!,��Y�Q��f�Yb=��@+�S�}���w�Y�Ƣ}��'�0�>�E�϶�/!%4������g�=�s��)^�|;������y�     
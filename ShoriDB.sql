PGDMP     $    ,                {            Shori    15.1    15.1 @    H           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            I           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            J           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            K           1262    16398    Shori    DATABASE     {   CREATE DATABASE "Shori" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
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
       public          postgres    false    226            L           0    0    BasketProduct_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public."BasketProduct_id_seq" OWNED BY public."BasketProduct".id;
          public          postgres    false    225            �            1259    16448    Basket_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Basket_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public."Basket_id_seq";
       public          postgres    false    224            M           0    0    Basket_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public."Basket_id_seq" OWNED BY public."Basket".id;
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
       public          postgres    false    222            N           0    0    Category_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public."Category_id_seq" OWNED BY public."Category".id;
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
       public          postgres    false    228            O           0    0    Comments_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public."Comments_id_seq" OWNED BY public."Comments".id;
          public          postgres    false    227            �            1259    16431    Product    TABLE       CREATE TABLE public."Product" (
    id integer NOT NULL,
    title text NOT NULL,
    price integer NOT NULL,
    "oldPrice" integer NOT NULL,
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
       public          postgres    false    220            P           0    0    Product_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public."Product_id_seq" OWNED BY public."Product".id;
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
       public          postgres    false    218            Q           0    0    Role_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public."Role_id_seq" OWNED BY public."Role".id;
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
       public          postgres    false    216            R           0    0    User_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public."User_id_seq" OWNED BY public."User".id;
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
       public          postgres    false    224    223    224            �           2604    16459    BasketProduct id    DEFAULT     x   ALTER TABLE ONLY public."BasketProduct" ALTER COLUMN id SET DEFAULT nextval('public."BasketProduct_id_seq"'::regclass);
 A   ALTER TABLE public."BasketProduct" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    225    226    226            �           2604    16443    Category id    DEFAULT     n   ALTER TABLE ONLY public."Category" ALTER COLUMN id SET DEFAULT nextval('public."Category_id_seq"'::regclass);
 <   ALTER TABLE public."Category" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    222    221    222            �           2604    20191    Comments id    DEFAULT     n   ALTER TABLE ONLY public."Comments" ALTER COLUMN id SET DEFAULT nextval('public."Comments_id_seq"'::regclass);
 <   ALTER TABLE public."Comments" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    227    228    228            �           2604    16434 
   Product id    DEFAULT     l   ALTER TABLE ONLY public."Product" ALTER COLUMN id SET DEFAULT nextval('public."Product_id_seq"'::regclass);
 ;   ALTER TABLE public."Product" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    220    220            �           2604    16425    Role id    DEFAULT     f   ALTER TABLE ONLY public."Role" ALTER COLUMN id SET DEFAULT nextval('public."Role_id_seq"'::regclass);
 8   ALTER TABLE public."Role" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    217    218            �           2604    16416    User id    DEFAULT     f   ALTER TABLE ONLY public."User" ALTER COLUMN id SET DEFAULT nextval('public."User_id_seq"'::regclass);
 8   ALTER TABLE public."User" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    216    216            A          0    16449    Basket 
   TABLE DATA           0   COPY public."Basket" (id, "userId") FROM stdin;
    public          postgres    false    224   �H       C          0    16456    BasketProduct 
   TABLE DATA           M   COPY public."BasketProduct" (id, "basketId", "productId", count) FROM stdin;
    public          postgres    false    226   @I       ?          0    16440    Category 
   TABLE DATA           .   COPY public."Category" (id, name) FROM stdin;
    public          postgres    false    222   ]I       E          0    20188    Comments 
   TABLE DATA           Y   COPY public."Comments" (id, date, description, likes, "userId", "productId") FROM stdin;
    public          postgres    false    228   J       =          0    16431    Product 
   TABLE DATA           q   COPY public."Product" (id, title, price, "oldPrice", count, img, "categoryId", belongs, description) FROM stdin;
    public          postgres    false    220   vJ       ;          0    16422    Role 
   TABLE DATA           *   COPY public."Role" (id, name) FROM stdin;
    public          postgres    false    218   cL       9          0    16413    User 
   TABLE DATA           F   COPY public."User" (id, login, password, email, "roleId") FROM stdin;
    public          postgres    false    216   �L       7          0    16401    _prisma_migrations 
   TABLE DATA           �   COPY public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
    public          postgres    false    214   JM       S           0    0    BasketProduct_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public."BasketProduct_id_seq"', 510, true);
          public          postgres    false    225            T           0    0    Basket_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public."Basket_id_seq"', 17, true);
          public          postgres    false    223            U           0    0    Category_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public."Category_id_seq"', 22, true);
          public          postgres    false    221            V           0    0    Comments_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public."Comments_id_seq"', 20, true);
          public          postgres    false    227            W           0    0    Product_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public."Product_id_seq"', 83, true);
          public          postgres    false    219            X           0    0    Role_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public."Role_id_seq"', 3, true);
          public          postgres    false    217            Y           0    0    User_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public."User_id_seq"', 22, true);
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
       public            postgres    false    228            �           2606    16438    Product Product_pkey 
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
       public          postgres    false    224    226    3228            �           2606    16479 *   BasketProduct BasketProduct_productId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."BasketProduct"
    ADD CONSTRAINT "BasketProduct_productId_fkey" FOREIGN KEY ("productId") REFERENCES public."Product"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 X   ALTER TABLE ONLY public."BasketProduct" DROP CONSTRAINT "BasketProduct_productId_fkey";
       public          postgres    false    226    3224    220            �           2606    16474    Basket Basket_userId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Basket"
    ADD CONSTRAINT "Basket_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 G   ALTER TABLE ONLY public."Basket" DROP CONSTRAINT "Basket_userId_fkey";
       public          postgres    false    224    3220    216            �           2606    20201     Comments Comments_productId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Comments"
    ADD CONSTRAINT "Comments_productId_fkey" FOREIGN KEY ("productId") REFERENCES public."Product"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 N   ALTER TABLE ONLY public."Comments" DROP CONSTRAINT "Comments_productId_fkey";
       public          postgres    false    3224    220    228            �           2606    20196    Comments Comments_userId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Comments"
    ADD CONSTRAINT "Comments_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 K   ALTER TABLE ONLY public."Comments" DROP CONSTRAINT "Comments_userId_fkey";
       public          postgres    false    228    216    3220            �           2606    17430    Product Product_categoryId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Product"
    ADD CONSTRAINT "Product_categoryId_fkey" FOREIGN KEY ("categoryId") REFERENCES public."Category"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 M   ALTER TABLE ONLY public."Product" DROP CONSTRAINT "Product_categoryId_fkey";
       public          postgres    false    222    3226    220            �           2606    17425    User User_roleId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_roleId_fkey" FOREIGN KEY ("roleId") REFERENCES public."Role"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 C   ALTER TABLE ONLY public."User" DROP CONSTRAINT "User_roleId_fkey";
       public          postgres    false    3222    216    218            A   3   x��A !�wF�	�
�_�uGaj��(��2[�2p�]���>���      C      x������ � �      ?   �   x�-�M� ��p�N��ۻ�ƶDmU����$]��poTOr-�4�;l=T��"�����%q$�����L�	\52��pƢ44�5��� �3����	?J�U�QL!�S՛n���`v��m�-Ak��RJ���>��!��@G      E   ^   x�3��4202�50�54R00�21�24�353�دpa���.l��}a'��)��1���cC=3S�@�6]l���mX�	HS� �"�      =   �  x����N�@�ϳO�@t���λ�R���A�ׄ���R�m%@���b>�����?k���!���w63����P�}ԕ�C��I�~���Ngk���{��B��BD��N��s�N8㿁;�k�c�3�<v}�N9���z��rȞsY��y�/n��AM�5ŭV��ԇz�|CX��<�x"d�UE	�h�w��)nh�$y��}��.�\�������|�UN��)Yk�&v	�s�s��	d�Έ�M⫩��O=���Ţ��^��3��	g���K��F�QA�+�W2�z��b�iM��W1Z�����=F���}1!������bs�{	���{;[���ﵻ3DG4��",Y�ԖM�\�̅�e[��M9��J���;���b�qH�[<��Y��m5�U�,�?�>�u��X��!�}��"W�!>#���l�}O�2�)�9\�-���U�����R�y|��      ;   $   x�3�LL����2�,-N-�2��M�KL�b���� ��      9   �   x�e��� �ϳ���7�����X9��ҭ����|��y
�u�ptݣ��K5�n̞��!J�=8��F��^j�np\�g��޸�t�^h9��	��4���5t�=�m�E�N�1M���"kf�n(J��S�G��vW�&���V��R c�t����%i`      7   �  x�mUYn9��O���ZXd��hp)�H��v0ן�7)����.�{|��"&�)��ԭ��`�;�U�8@)յ�0���sT`��6�䵨-��M�E�Yt,�Q¸����DxTS�����"!c�@���/�����9΂��sx�k�\F��;[2�%�@��3�2;Z����� �0V�R9�sɈĽ4�CK)Z���	�/�v�^i�/��œt��Gv��I� �W2���CTVk�+��B	fYH�AA4���ؒ:W܂�ls6�>dV�v��|B81U
f���}�}������J�]1�Y�z���V}��Bqi���4��bë�e<��(2t�q��SG�5O^v�BN �=��z8w�O����������,.�l��*���-9����C�����4�!w��0sXن���Ƥ�^s润�/��wj�Gc�ʳ��r�@��QO�'�c�F���9�U��ş�����`��
�V &�T���'�@� �9�sQ��[���rt��l-����M{��[���X�C�Ȑ��������K��
~F����|n����W$��s���U��.�«=E�!�wI����aX`���l���ȁ;��Hl��ǃ��G�D��s4�4��7AU�(�0r�o%�U��$"��J���Ǉ���������e�y-F��Xsd�'@RsM�G�}��¶vT{�������UYk��%�VZyWi��K�j�5g�E{�"����7��϶��Jpjs;o㟶�}M�PR�б��ïi��$\~���I�2�khJ#�f6m�h���G�`�(j���#���L�8*xQ�Qp���v�P=�Ê��	�]�*�.Px��Oxy�`��<GU�e%��5L<<X�a�C!��&�b��C�d}���hUǉ5">4^g$�zC$� s
��	���E�(��gح�U���`����b�m��x:�z9?>��Z"Z*"ߏwww���^     
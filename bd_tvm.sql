
-- Banco de dados: `bd_tvm`
--
CREATE DATABASE  `bd_tvm` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `bd_tvm`;

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `nome` varchar(60) DEFAULT NULL,
  `data_criacao` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `email` varchar(40) DEFAULT NULL,
  `codigo_cliente` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELACIONAMENTOS PARA TABELAS `cliente`:
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `funcionarios`
--

CREATE TABLE `funcionarios` (
  `nome_usuario` varchar(60) DEFAULT NULL,
  `email` varchar(20) NOT NULL,
  `telefone` varchar(20) NOT NULL,
  `cargo` varchar(25) NOT NULL,
  `criacao_conta` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `numero_identificacao` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELACIONAMENTOS PARA TABELAS `funcionarios`:
--   `nome_usuario`
--       `usuario` -> `nome_usuario`
--

--
-- Estrutura da tabela `problemas`
--

CREATE TABLE `problemas` (
  `codigo_problema` int(60) NOT NULL,
  `status_problema` varchar(25) NOT NULL,
  `codigo_cliente` int(30) NOT NULL,
  `descricao_problema` varchar(200) NOT NULL,
  `codigo_tecnico` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELACIONAMENTOS PARA TABELAS `problemas`:
--   `codigo_cliente`
--       `cliente` -> `codigo_cliente`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `nome_usuario` varchar(60) NOT NULL,
  `senha` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELACIONAMENTOS PARA TABELAS `usuario`:
--

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`codigo_cliente`);

--
-- Índices para tabela `funcionarios`
--
ALTER TABLE `funcionarios`
  ADD PRIMARY KEY (`numero_identificacao`),
  ADD KEY `nome_usuario` (`nome_usuario`);

--
-- Índices para tabela `problemas`
--
ALTER TABLE `problemas`
  ADD PRIMARY KEY (`codigo_problema`),
  ADD KEY `codigo_cliente` (`codigo_cliente`);

--
-- Índices para tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`nome_usuario`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `problemas`
--
ALTER TABLE `problemas`
  MODIFY `codigo_problema` int(60) NOT NULL AUTO_INCREMENT;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `funcionarios`
--
ALTER TABLE `funcionarios`
  ADD CONSTRAINT `funcionarios_ibfk_1` FOREIGN KEY (`nome_usuario`) REFERENCES `usuario` (`nome_usuario`);

--
-- Limitadores para a tabela `problemas`
--
ALTER TABLE `problemas`
  ADD CONSTRAINT `problemas_ibfk_1` FOREIGN KEY (`codigo_cliente`) REFERENCES `cliente` (`codigo_cliente`);
COMMIT;

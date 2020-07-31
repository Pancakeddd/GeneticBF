#pragma once

#include <array>
#include <string>
#include <sstream>
#include <vector>
#include <memory>
#include <cstdint>

struct BFEnvironment;
struct OptimizerCTX;

enum BFOPType
{
  NOP,
  INC,
  DEC,
  SHL,
  SHR,
  LOL,
  LOR,
  OUT
};

struct BFIP
{
  enum BFIPOpType
  {
    NLL,
    ADD,
    SHIFT,
    BLOCK,
    SET,
    OUT
  };

  BFIPOpType type;
  int it;
  int pos;
  std::vector<std::shared_ptr<BFIP>> body;

  void Execute(BFEnvironment &);
  void Execute(std::shared_ptr<BFIP> &, std::shared_ptr<OptimizerCTX> &);
  std::string Show(unsigned int = 0);
  std::string Recompile();
};

struct OptimizerCTX
{
  int ptr;
  bool pure;

  OptimizerCTX() : ptr(0), pure(true)
  {
  }
};

struct BFEnvironment
{

  static const unsigned int size = 10000;

  std::array<uint8_t, size> memory;
  unsigned int iptr;
  bool exception;

  BFEnvironment() : iptr(0), exception(false)
  {
    memory.fill(0); // Initialize every index with 0
  }

  constexpr BFOPType ToOP(char &);
  std::vector<BFOPType> Read(std::string);
  constexpr bool IsInBound();
  void Shift(int);
  uint8_t &Peek();
  uint8_t &Peek(int);

  std::shared_ptr<BFIP> IPGetAddSub(unsigned int &, std::vector<BFOPType> &);
  std::shared_ptr<BFIP> IPGetShift(unsigned int &, std::vector<BFOPType> &);
  std::shared_ptr<BFIP> IPGetBlock(unsigned int &, std::vector<BFOPType> &);
  std::shared_ptr<BFIP> IPGetOut(unsigned int &, std::vector<BFOPType> &);

  std::vector<std::shared_ptr<BFIP>> Transform(std::vector<BFOPType> &);
  std::vector<std::shared_ptr<BFIP>> Transform(unsigned int &, std::vector<BFOPType> &);

  std::shared_ptr<BFIP> IPOptSet(unsigned int &, std::vector<std::shared_ptr<BFIP>> &, std::shared_ptr<OptimizerCTX> &);
  std::shared_ptr<BFIP> IPOptBlock(unsigned int &, std::vector<std::shared_ptr<BFIP>> &, std::shared_ptr<OptimizerCTX> &);

  std::vector<std::shared_ptr<BFIP>> Optimize(std::vector<std::shared_ptr<BFIP>> &);
};
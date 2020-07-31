#include "bf.h"
#include <iostream>

#define BFIP_Check(f)  \
  ip = f(i, ops);      \
  if (ip != nullptr)   \
  {                    \
    buf.push_back(ip); \
    continue;          \
  }

#define BFIP_CheckOpt(f) \
  ip = f(i, ips, ctx);   \
  if (ip != nullptr)     \
  {                      \
    buf.push_back(ip);   \
    continue;            \
  }

void BFIP::Execute(BFEnvironment &e)
{
  unsigned int count = 0;
  switch (type)
  {
  case BFIPOpType::ADD:
    e.Peek() += it;
    break;

  case BFIPOpType::SHIFT:
    e.Shift(it);
    break;

  case BFIPOpType::SET:
    e.Shift(pos);
    e.Peek() += it;
    break;

  case BFIPOpType::BLOCK:
    while (e.Peek() != 0 && count < 45)
    {
      //std::cout << "::" << (int)e.Peek(ix) << std::endl;
      //std::cout << e.iptr << ":";
      for (const auto &ip : body)
      {
        //std::cout << "x";
        ip->Execute(e);
      }
      ++count;
    }

    if (count >= 45)
    {
      e.exception = true;
    }
    break;

  case BFIPOpType::OUT:
    //std::cout << static_cast<char>(e.Peek());
    break;
  default:
    break;
  }
}

void BFIP::Execute(std::shared_ptr<BFIP> &ip, std::shared_ptr<OptimizerCTX> &ctx)
{
  switch (type)
  {
  case BFIPOpType::ADD:
    ip->it += it;
    break;

  case BFIPOpType::SHIFT:
    ip->pos += it;

    break;

  default:
    break;
  }
}

std::string BFIP::Show(unsigned int indent)
{
  std::string op;
  switch (type)
  {
  case ADD:
    op = "Add";
    break;

  case SHIFT:
    op = "Shift";
    break;

  case SET:
    op = "Set";
    break;

  case BLOCK:
    op = "Block";
    break;

  case OUT:
    op = "Out";
    break;

  default:
    break;
  }

  std::stringstream ss;
  if (type == SET)
  {
    ss << op << ' ' << it << ' ' << pos;
  }
  else if (type == BLOCK)
  {
    std::stringstream ind;

    for (size_t i = 0; i < indent; ++i)
    {
      ind << "  ";
    }

    ss << op << '\n';
    for (const auto &v : body)
    {
      ss << ind.str() << "| " << v->Show(indent + 1) << std::endl;
    }
  }

  else
  {
    ss << op << " " << it;
  }

  return ss.str();
}

std::string BFIP::Recompile()
{
  std::stringstream ss;
  switch (type)
  {
  case ADD:
    for (size_t i = 0; i < abs(it); ++i)
    {
      if (it > 0)
      {
        ss << '+';
      }
      else
      {
        ss << '-';
      }
    }
    break;

  case SHIFT:
    for (size_t i = 0; i < abs(it); ++i)
    {
      if (it > 0)
      {
        ss << '>';
      }
      else
      {
        ss << '<';
      }
    }
    break;

  case BLOCK:
    if (!body.empty())
    {
      ss << '[';
      for (auto const &i : body)
      {
        ss << i->Recompile();
      }
      ss << ']';
      break;
    }

  default:
    break;
  }

  return ss.str();
}

constexpr BFOPType BFEnvironment::ToOP(char &c)
{
  switch (c)
  {
  case '+':
    return BFOPType::INC;
    break;
  case '-':
    return BFOPType::DEC;
    break;
  case '>':
    return BFOPType::SHR;
    break;
  case '<':
    return BFOPType::SHL;
    break;
  case '[':
    return BFOPType::LOL;
    break;
  case ']':
    return BFOPType::LOR;
    break;
  case '.':
    return BFOPType::OUT;
    break;
  default:
    return BFOPType::NOP;
    break;
  }
}

std::vector<BFOPType> BFEnvironment::Read(std::string s)
{
  auto buf = std::vector<BFOPType>();

  unsigned int i = 0;
  while (true)
  {
    if (i < s.size())
    {
      auto t = ToOP(s[i++]);
      if (t != BFOPType::NOP)
      {
        buf.push_back(t);
      }
      else if (i >= s.size())
      {
        break;
      };
    }
    else
    {
      break;
    }
  }
  return buf;
}

constexpr bool BFEnvironment::IsInBound()
{
  return (iptr > 0 && iptr < size);
}

void BFEnvironment::Shift(int dir)
{
  auto mov = iptr + dir;
  if (mov < 0 || mov >= size)
  {
    mov = 0;
  }
  iptr = mov;
}

uint8_t &BFEnvironment::Peek()
{
  return memory.at(iptr);
}

uint8_t &BFEnvironment::Peek(int i)
{
  return memory.at(i);
}

std::shared_ptr<BFIP> BFEnvironment::IPGetAddSub(unsigned int &i, std::vector<BFOPType> &ops)
{
  std::shared_ptr<BFIP> ip = std::make_shared<BFIP>();
  ip->type = BFIP::BFIPOpType::ADD;
  ip->it = 0;
  while (i < ops.size() && (ops.at(i) == BFOPType::INC || ops.at(i) == BFOPType::DEC))
  {
    (ops.at(i) == BFOPType::INC) ? ++ip->it : --ip->it;
    ++i;
  }

  if (ip->it == 0)
  {
    return std::shared_ptr<BFIP>(nullptr);
  }

  return ip;
}

std::shared_ptr<BFIP> BFEnvironment::IPGetShift(unsigned int &i, std::vector<BFOPType> &ops)
{
  std::shared_ptr<BFIP> ip = std::make_shared<BFIP>();
  ip->type = BFIP::BFIPOpType::SHIFT;
  ip->it = 0;
  while (i < ops.size() && (ops.at(i) == BFOPType::SHL || ops.at(i) == BFOPType::SHR))
  {
    (ops.at(i) == BFOPType::SHR) ? ++ip->it : --ip->it;
    ++i;
  }

  if (ip->it == 0)
  {
    return std::shared_ptr<BFIP>(nullptr);
  }

  return ip;
}

std::shared_ptr<BFIP> BFEnvironment::IPGetBlock(unsigned int &i, std::vector<BFOPType> &ops)
{
  if (i < ops.size() && ops.at(i) == BFOPType::LOL)
  {
    unsigned int i_snap = i + 1;
    std::shared_ptr<BFIP> ip = std::make_shared<BFIP>();
    ip->type = BFIP::BFIPOpType::BLOCK;
    ip->body = Transform(i_snap, ops);

    i = i_snap;

    return ip;
  }
  return std::shared_ptr<BFIP>(nullptr);
}

std::shared_ptr<BFIP> BFEnvironment::IPGetOut(unsigned int &i, std::vector<BFOPType> &ops)
{
  if (i < ops.size() && ops.at(i) == BFOPType::OUT)
  {
    std::shared_ptr<BFIP> ip = std::make_shared<BFIP>();
    ip->type = BFIP::BFIPOpType::OUT;

    ++i;
    return ip;
  }
  return std::shared_ptr<BFIP>(nullptr);
}

std::vector<std::shared_ptr<BFIP>> BFEnvironment::Transform(std::vector<BFOPType> &ops)
{
  std::vector<std::shared_ptr<BFIP>> buf = std::vector<std::shared_ptr<BFIP>>();

  std::shared_ptr<BFIP> ip;
  unsigned int i = 0;

  while (true)
  {
    if (i < ops.size() && ops.at(i) == BFOPType::LOR)
    {
      ++i;
    }
    BFIP_Check(IPGetAddSub);
    BFIP_Check(IPGetShift);
    BFIP_Check(IPGetBlock);
    BFIP_Check(IPGetOut);
    if (ip == nullptr)
    {
      break;
    }

    ip = nullptr;
  }

  return buf;
}

std::vector<std::shared_ptr<BFIP>> BFEnvironment::Transform(unsigned int &i, std::vector<BFOPType> &ops)
{
  std::vector<std::shared_ptr<BFIP>> buf = std::vector<std::shared_ptr<BFIP>>();

  std::shared_ptr<BFIP> ip;

  while (true)
  {
    if (i < ops.size() && ops.at(i) == BFOPType::LOR)
    {
      ++i;
      break;
    }
    BFIP_Check(IPGetAddSub);
    BFIP_Check(IPGetShift);
    BFIP_Check(IPGetBlock);
    BFIP_Check(IPGetOut);
    if (ip == nullptr)
    {
      break;
    }

    ip = nullptr;
  }

  return buf;
}

// Optimizer

std::shared_ptr<BFIP> BFEnvironment::IPOptSet(unsigned int &i, std::vector<std::shared_ptr<BFIP>> &ops, std::shared_ptr<OptimizerCTX> &ctx)
{
  if (!ctx->pure)
  {
    return std::shared_ptr<BFIP>(nullptr);
  }
  auto i_snap = i;
  std::shared_ptr<BFIP> ip = std::make_shared<BFIP>();
  ip->type = BFIP::BFIPOpType::SET;
  ip->it = 0;
  ip->pos = 0;
  if (i < ops.size() && ops.at(i)->type == BFIP::BFIPOpType::SHIFT)
  {
    ops.at(i)->Execute(ip, ctx);
    ++i;
    if (i < ops.size() && ops.at(i)->type == BFIP::BFIPOpType::ADD)
    {
      ops.at(i)->Execute(ip, ctx);
      ++i;
    }
    else
    {
      i = i_snap;
      return std::shared_ptr<BFIP>(nullptr);
    }
  }
  else
  {
    return std::shared_ptr<BFIP>(nullptr);
  }

  return ip;
}

std::shared_ptr<BFIP> BFEnvironment::IPOptBlock(unsigned int &i, std::vector<std::shared_ptr<BFIP>> &ops, std::shared_ptr<OptimizerCTX> &ctx)
{
  auto i_snap = i;
  if (i < ops.size() && ops.at(i)->type == BFIP::BFIPOpType::BLOCK)
  {
    auto ip = ops.at(i);

    auto cpy = std::make_shared<BFIP>(*ip);

    cpy->body = Optimize(ip->body);

    ++i;
    return cpy;
  }
  i = i_snap;
  return std::shared_ptr<BFIP>(nullptr);
}

std::vector<std::shared_ptr<BFIP>> BFEnvironment::Optimize(std::vector<std::shared_ptr<BFIP>> &ips)
{
  std::shared_ptr<OptimizerCTX> ctx = std::make_shared<OptimizerCTX>();
  std::vector<std::shared_ptr<BFIP>> buf = std::vector<std::shared_ptr<BFIP>>();

  std::shared_ptr<BFIP> ip;
  unsigned int i = 0;

  while (true)
  {
    BFIP_CheckOpt(IPOptSet);
    BFIP_CheckOpt(IPOptBlock);
    if (ip == nullptr && i >= ips.size())
    {
      break;
    }
    else if (ip == nullptr && i < ips.size())
    {
      buf.push_back(ips.at(i));
      ++i;
    }
  }

  return buf;
}
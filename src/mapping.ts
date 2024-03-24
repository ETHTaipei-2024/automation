//@ts-ignore
import { require, console } from "@ora-io/cle-lib";
import { Bytes, Block, Event } from "@ora-io/cle-lib";

// automation address
let addr = Bytes.fromHexString('0x3E18Dc36AD0cB2f9c75d1edf7CA37f68abB8F13C');
// event signature of `event Requested(uint256 indexed id, string fhe);`
let esig_sync = Bytes.fromHexString("0xeb82ddf033f40993b9d3e74f96214944168d3c6a1001f991ce326f44f84a8df4");

export function handleBlocks(blocks: Block[]): Bytes {
  // fetch event by address and event signature
  let eventsByAcctEsig: Event[] = blocks[0].account(addr).eventsByEsig(esig_sync);

  // require match event count > 0
  require(eventsByAcctEsig.length > 0, "Trigger condition failed.");

  // load data from event
  let data: Bytes = eventsByAcctEsig[0].data;

  return Bytes.fromHexString("0x1234");
}
